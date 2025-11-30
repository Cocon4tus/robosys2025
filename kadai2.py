import sys

data = sys.stdin.read().strip()

if not data:
    sys.exit(0)

allowed = "0123456789+-*/()."

for ch in data:
    if ch not in allowed:
        
        sys.exit(1)
    
result = eval(data)

print(result)


