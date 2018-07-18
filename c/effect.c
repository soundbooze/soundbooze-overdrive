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
#include <math.h>

#include "effect.h"

void
_effect_warmtube (double *buf_d, size_t N)
{
  register_t i = 0;
  for (; i < N; i++) {
    *(buf_d + i) = buf_d[i] / (1 + fabs(buf_d[i]));
  }
}

void 
_effect_overdrive (double *buf_d, size_t N)
{
  register_t i = 0;
  for (; i < N; i++) {
    *(buf_d + i) = (60.6 * buf_d[i]) - 0.6 * buf_d[i] * buf_d[i] * buf_d[i];
  }
}

void 
_effect_distortion (double *buf_d, size_t N)
{
  const int16_t amplify = 210;

  register_t i = 0;
  for (; i < N; i++) {
    *(buf_d + i) *= amplify;
  }
}

void 
effect_process (double *buf_d, size_t N)
{
  _effect_overdrive(buf_d, N);
  _effect_warmtube(buf_d, N);
}
