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
#include "pcm.h"

void
pcm_to_double (const int16_t *buf_p, double *buf_d, size_t N)
{
  register_t i = 0;
  for (; i < N; i++) {
    double d = ((double) *(buf_p + i)) / (double) PCM_S16LE;
    if (d > 1) d = 1.0;
    if (d < -1) d = -1.0;
    *(buf_d + i) = d;
  }
}

void
double_to_pcm (const double *buf_d, int16_t *buf_p, size_t N)
{
  register_t i = 0;
  for (; i < N; i++) {
    double d = *(buf_d + i) * (double) PCM_S16LE;
    if (d > PCM_S16LE) d = PCM_S16LE;
    if (d < -PCM_S16LE) d = -PCM_S16LE;
    *(buf_p + i) = (int16_t) d;
  }
}
