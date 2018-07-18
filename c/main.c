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

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <pthread.h>

#include "sio.h"

#define SIGNED       1
#define BITS        16
#define CHANNELS     2
#define RATE     44100

static pthread_t pth;

void
usage(void)
{
  fprintf(stderr, "usage: soundbooze [-p playback device] [-c capture device] [-r output.pcm]\n");
  exit(EXIT_FAILURE);
}


void
main_signal_handler (int sig)
{
  sio_close_all();
  pthread_exit(&pth);
  fprintf(stderr, "[-] Abnormal program termination!\n");
  exit(EXIT_FAILURE);
}

int
main (int argc, char **argv)
{
  char *playback_device = "snd/0";
  char *capture_device = "rsnd/1";
  char *output_recording = NULL;

  int ch;

  while ((ch = getopt(argc, argv, "p:c:r:h")) != -1) {
    switch (ch) {
      case 'p':
        playback_device = optarg;
        break;
      case 'c':
        capture_device = optarg;
        break;
      case 'r':
        output_recording = optarg;
        break;
      case 'h':
      default:
        usage();
        break;
    }
  }

  argc -= optind;
  argv += optind;

  signal(SIGINT, main_signal_handler);
  signal(SIGTERM, main_signal_handler);
  signal(SIGQUIT, main_signal_handler);
  signal(SIGKILL, main_signal_handler);
  signal(SIGSEGV, main_signal_handler);

  sio_init(SIGNED, BITS, CHANNELS, RATE, playback_device, capture_device);

  if (pthread_create(&pth, NULL, sio_main, (void *) output_recording)) {
    main_signal_handler(SIGIO);
  }

  pthread_join(pth, NULL);

  
  return EXIT_SUCCESS;
}
