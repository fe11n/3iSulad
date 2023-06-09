/******************************************************************************
 * Copyright (c) Huawei Technologies Co., Ltd. 2018-2022. All rights reserved.
 * iSulad licensed under the Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *     http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR
 * PURPOSE.
 * See the Mulan PSL v2 for more details.
 * Author: tanyifeng
 * Create: 2018-11-07
 * Description: provide filters function definition
 ******************************************************************************/
#ifndef UTILS_CUTILS_FILTERS_H
#define UTILS_CUTILS_FILTERS_H

#include <stdbool.h>
#include <stddef.h>
#include <isula_libutils/json_common.h>

#include "map.h"

#ifdef __cplusplus
extern "C" {
#endif

struct filters_args {
    // A map of map[string][map[string][bool]]
    map_t *fields;
};

typedef bool (*valid_filter_value_t)(const char *value);
typedef char *(*pre_processe_t)(const char *value);

struct filter_opt {
    char *name;
    valid_filter_value_t valid;
    pre_processe_t pre;
};

struct filters_args *filters_args_new(void);

void filters_args_free(struct filters_args *filters);

char **filters_args_get(const struct filters_args *filters, const char *field);

bool filters_args_add(struct filters_args *filters, const char *name,
                      const char *value);

bool filters_args_del(struct filters_args *filters, const char *name,
                      const char *value);

size_t filters_args_len(const struct filters_args *filters);

bool filters_args_valid_key(const char **accepted, size_t len, const char *field);

bool filters_args_match_kv_list(const struct filters_args *filters, const char *field,
                                const map_t *sources);

bool filters_args_exact_match(const struct filters_args *filters, const char *field, const char *source);

bool filters_args_match(const struct filters_args *filters, const char *field, const char *source);

int do_add_filters(const char *filter_key, const json_map_string_bool *filter_value,
                   struct filters_args *filters,
                   valid_filter_value_t valid_ops, pre_processe_t pre_ops);
#ifdef __cplusplus
}
#endif

#endif
