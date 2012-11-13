## TODO: this is very rough and needs quite some work before it can be used by anyone except Tobias

CHKLIST='morgenrutiner'
MUSICDIR='/home/tobias/s3/music.tobixen/checklists/'

while [ 1 ] ; do
query="select start_time,checkpoint_who,checkpoint_id,pg_sleep(extract(epoch from start_time-now()::time)) from checkpoint where start_time>now()::time and checklist='$CHKLIST' order by start_time limit 1;"
data=$(echo $query | ssh srv1.bekkenstenveien53c.oslo.no psql -At checklist_db)
start_time=$(echo "$data" | cut -f1 -d'|')
who=$(echo "$data" | cut -f2 -d'|')
what=$(echo "$data" | cut -f3 -d'|')

echo "aplay $MUSICDIR/$CHKLIST/pre_time.wav  $MUSICDIR/$CHKLIST/time/$start_time.wav  $MUSICDIR/$CHKLIST/time_to_who.wav $MUSICDIR/$CHKLIST/who/$who.wav $MUSICDIR/$CHKLIST/what/$what.wav"
aplay $MUSICDIR/$CHKLIST/pre_time.wav  $MUSICDIR/$CHKLIST/time/$start_time.wav  $MUSICDIR/$CHKLIST/time_to_who.wav $MUSICDIR/$CHKLIST/who/$who.wav $MUSICDIR/$CHKLIST/what/$what.wav

done
