/*
 * Copyright (c) 2016 SoundBooze <soundbooze@gmail.com>
 *                            _ _                        
 *  ___  ___  _   _ _ __   __| | |__   ___   ___ _______ 
 * / __|/ _ \| | | | '_ \ / _` | '_ \ / _ \ / _ \_  / _ \
 * \__ \ (_) | |_| | | | | (_| | |_) | (_) | (_) / /  __/
 * |___/\___/ \__,_|_| |_|\__,_|_.__/ \___/ \___/___\___|
 *                                                     
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

#include <err.h>
#include <poll.h>
#include <unistd.h>
#include <fcntl.h>
#include <sndio.h>
#include <sys/stat.h>
#include <sys/mman.h>

#include "sio.h"
#include "pcm.h"
#include "effect.h"

struct sio_hdl *hdl_play;
struct sio_hdl *hdl_capture;

struct sio_par par_play;
struct sio_par par_capture;

int fd;

void
sio_close_all (void)
{
  if (close(fd) == -1) {
    errx(1, "close(): failed\n");
  }

  if (!sio_stop(hdl_capture)) {
    errx(1, "sio_stop(): failed\n");
  }
  if (!sio_stop(hdl_play)) {
    errx(1, "sio_stop(): failed\n");
  }
  sio_close(hdl_capture);
  sio_close(hdl_play);
}

void
sio_init (const unsigned int sig, const unsigned int bits, 
          const unsigned int chan, const unsigned int rate, 
          const char *playback_device, const char *capture_device)
{
  sio_initpar(&par_play);
  par_play.sig = sig;
  par_play.le = SIO_LE_NATIVE;
  par_play.bits = bits;
  par_play.pchan = chan;
  par_play.rate = rate;
  par_play.xrun = SIO_IGNORE;

  sio_initpar(&par_capture);
  par_capture.sig = sig;
  par_capture.le = SIO_LE_NATIVE;
  par_capture.bits = bits;
  par_capture.rchan = chan;
  par_capture.rate = rate;
  par_capture.xrun = SIO_IGNORE;

  hdl_play = sio_open(playback_device, SIO_PLAY, 0);
  if (hdl_play == NULL) {
    errx(1, "sio_open(): failed\n");
  }

  hdl_capture = sio_open(capture_device, SIO_REC, 0);
  if (hdl_capture == NULL) {
    errx(1, "sio_open(): failed\n");
  }

  if (!sio_setpar(hdl_play, &par_play)) {
    errx(1, "sio_setpar(): failed\n");
  }

  if (!sio_setpar(hdl_capture, &par_capture)) {
    errx(1, "sio_setpar(): failed\n");
  }

  if (!sio_getpar(hdl_play, &par_play)) {
    errx(1, "sio_getpar(): failed\n");
  }

  if (!sio_getpar(hdl_capture, &par_capture)) {
    errx(1, "sio_getpar(): failed\n");
  }

  if (!sio_start(hdl_play)) {
    errx(1, "sio_start(): failed\n");
  }

  if (!sio_start(hdl_capture)) {
    errx(1, "sio_start(): failed\n");
  }
}

void
_sio_poll_wait_ (struct sio_hdl *hdl)
{
  int nfds, revents;
  struct pollfd pfds[1];
  do {
    nfds = sio_pollfd(hdl, pfds, POLLOUT);
    if (nfds > 0) {
      if (poll(pfds, nfds, -1) < 0)
        errx(1, "poll(): failed\n");
    }
    revents = sio_revents(hdl, pfds);
    if (revents & POLLHUP)
      errx(1, "poll(): device disappeared\n");
  } while (!(revents & POLLOUT));
}

void *
sio_main (void *output_recording)
{
  size_t len_r, len_w;
  size_t bufsz = par_capture.bps * par_capture.rchan * par_capture.round;

  int16_t buf_p[bufsz];
  double buf_d[bufsz];

  if (output_recording) {
    fd = open((const char *) output_recording, O_CREAT | O_TRUNC | O_SYNC | O_WRONLY, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    if (fd == -1) {
      errx(1, "open(): failed\n");
    }
  }

  while(1) {

    if (mprotect((void *) buf_p, bufsz, PROT_READ | PROT_WRITE) < 0) {
      errx(1, "mprotect(): failed\n"); 
    }

    if (mprotect((void *) buf_d, bufsz, PROT_READ | PROT_WRITE) < 0) {
      errx(1, "mprotect(): failed\n"); 
    }

    len_r = sio_read(hdl_capture, buf_p, bufsz);
    if (sio_eof(hdl_capture)) {
      errx(1, "sio_read(): failed\n");
    }

    pcm_to_double(buf_p, buf_d, len_r);
    effect_process(buf_d, len_r);
    double_to_pcm(buf_d, buf_p, len_r);

    _sio_poll_wait_(hdl_play);

    len_w = sio_write(hdl_play, buf_p, len_r);
    if (sio_eof(hdl_play)) {
      errx(1, "sio_write(): failed\n");
    }

    if (output_recording) {
      if (write(fd, (const void *) buf_p, len_r) == -1) {
        errx(1, "write(): failed\n");
      }
    }

  }

  
}
