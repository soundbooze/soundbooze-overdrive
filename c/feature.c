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

#include "feature.h"

double
_find_maximum (double *buf, size_t N)
{
  double max = 0;
  register_t i = 0;
  for (; i < N; i++) {
    double _m = fabs(*(buf + i));
    if (_m > max)
      max = _m;
  }
  return max;
}

double 
get_energy (double *buf, size_t N) {
  double energy = 0.0;
  register_t i = 0;
  for (; i < N; i++) {
    energy += pow(*(buf + i), 2.0);
  }
  return energy;
};

double
get_rms (double *buf, size_t N) {
  double rms = 0.0;
  register_t i = 0;
  for (; i < N; i++) {
    rms += pow(*(buf + i), 2.0);
  }
  rms = rms / N;
  rms = sqrt(rms);
  return rms; 
};

double
get_decibel (double rms, size_t N) {
  return 20.0 * (logf(rms) / 2.302585092994);
};
