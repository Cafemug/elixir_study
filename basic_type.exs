# 기본 타입
IO.puts 1
IO.puts 0x1F
IO.puts 1.0
IO.puts :atom

# 사칙연산
IO.puts div(10, 2)
IO.puts div 10, 2
IO.puts rem 10, 3

# 반올림, 버림
IO.puts  round 3.58
IO.puts  trunc 3.58

# boolean
IO.puts true
IO.puts true == false
IO.puts is_boolean(true)
IO.puts is_boolean(1)
