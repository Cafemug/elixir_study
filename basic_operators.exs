# 리스트 조작 및 문자열 결합
IO.inspect [1,2,3] ++ [4,5,6]
IO.inspect [1,2,3] -- [2]
IO.inspect "foo" <> "bar"

# 논리연산자
IO.inspect true and true
IO.inspect false or is_atom(:example)
IO.inspect 1 and true # 에러
# IO.inspect false and error("This error will never be raised")
# IO.inspect  true or error("This error will never be raised")