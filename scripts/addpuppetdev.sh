BASE=/home/${USER}

REPO=git@gitlab.puppetspecialist.nl:puppet/control.git

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

git clone --branch integration "$REPO" "$BASE/dev_${USER}"
if [ $? -ne 0 ]
then
        echo ======================================
        echo  You need to do the following BEFORE running this script:
        echo    - setup ssh pubkey in gitlab
        echo ======================================
        exit 1
fi
cd "$BASE/dev_${USER}"
r10k puppetfile install

for i in role profile
do
        cd "$BASE/dev_${USER}/modules/$i"
	git branch master
	git branch develop
	git checkout develop
	git pull origin develop
        git flow init -fd
        cd -
done

echo ======================================
echo    All done, enjoy!
echo ======================================
echo    location:  $BASE/dev_${USER}
echo ======================================

