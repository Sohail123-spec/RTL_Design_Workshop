import re, sys
lib = open(sys.argv[1]).read()
net = open(sys.argv[2]).read()
spans = list(re.finditer(r'\bcell\s*\(\s*"?(\w+)"?\s*\)\s*\{', lib))
cells = {}
for i, m in enumerate(spans):
    end = spans[i+1].start() if i+1 < len(spans) else len(lib)
    cells[m.group(1)] = set(re.findall(r'\bpin\s*\(\s*"?([^")\s]+)"?\s*\)', lib[m.end():end]))
bad = n = 0
for m in re.finditer(r'^\s*(sky130_fd_sc_hd__\w+)\s+(\\\S+|\w+)\s*\((.*?)\)\s*;', net, re.M | re.S):
    cell, inst, body = m.groups(); n += 1
    if cell not in cells:
        print(f"UNKNOWN CELL {cell} ({inst})"); bad += 1; continue
    for p in re.findall(r'(?:^|[\s,(])\.(\w+)\s*\(', body):
        if p not in cells[cell]:
            print(f"BAD PIN {inst} ({cell}): .{p}"); bad += 1
print(f"checked {n} instances, {bad} violations")
sys.exit(1 if bad else 0)
