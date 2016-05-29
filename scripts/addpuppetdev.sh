BASE=/home/${USER}

GITSERVER=codereview.example.com
PORT=22
REPO=ssh://$GITSERVER:$PORT/Puppet-Control

if [ "$USER" = 'root' ]
then
        echo "Not intended to run as root."
        exit 1
fi

if [ -d "$BASE/dev_${USER}" ]
then
        echo "Local directory already exists!"
        exit 1
fi

ssh -p $PORT $GITSERVER
if [ $? -ne 127 ]
then
        echo ======================================
        echo  You need to do the following BEFORE running this script:
        echo    - setup ssh pubkey in gerrit
        echo ======================================
        exit 1
fi

mkdir -p "$BASE/dev_${USER}"
git clone --branch integration "$REPO" "$BASE/dev_${USER}"
cd "$BASE/dev_${USER}"
r10k puppetfile install

for i in role profile company
do
        cd "$BASE/dev_${USER}/modules/$i"
        scp -p -P $PORT $GITSERVER:hooks/commit-msg .git/hooks/
        git flow init -fd
        cd -
done

scp -p -P 29418 $GITSERVER:hooks/commit-msg "$BASE/dev_${USER}/.git/hooks/"

echo ======================================
echo    All done, enjoy!
echo ======================================
echo    location:  $BASE/dev_${USER}
echo ======================================

