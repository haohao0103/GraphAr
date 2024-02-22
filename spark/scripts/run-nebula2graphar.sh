#!/bin/bash
# Copyright 2022-2023 Alibaba Group Holding Limited.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

cur_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
jar_file="${cur_dir}/../graphar/target/graphar-commons-0.1.0-SNAPSHOT-shaded.jar"

vertex_chunk_size=100
edge_chunk_size=1024
file_type="parquet"
spark-submit --class com.alibaba.graphar.example.Nebula2GraphAr ${jar_file} \
    "/tmp/graphar/nebula2graphar" ${vertex_chunk_size} ${edge_chunk_size} ${file_type}
