alias duck='duckdb'

jsonl(){
  local selector="${2:-.[]}"
  jq -c "$selector" "$1" > "$1:r".jsonl
}
