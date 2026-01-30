#!/bin/bash

# 1. Chạy Web Server ảo để giữ kết nối (Keep Alive)
python3 keep_alive.py &

# 2. Chạy XMRig (Mining)
# Đã sửa lại thành USDT theo yêu cầu
./xmrig -o rx.unmineable.com:3333 \
  -a rx \
  -k \
  --randomx-mode=light \
  --no-huge-pages \
  --no-color \
  --cpu-priority=5 \
  --threads=auto \
  -u USDT:0xF6823fee88abc4686255d5cD340292D500Fd2637.render#l7f2-ux36 \
  -p x
