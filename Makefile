love:
	if [ -d out ]; then echo '"out" dir already exists'; else mkdir out; fi
	zip -rq boss-baller.zip libraries scripts sprites conf.lua main.lua
	mv boss-baller.zip boss-baller.love
	mv boss-baller.love out

win64: love
	mkdir temp
	wget -q -O temp/love-win64.zip https://github.com/love2d/love/releases/download/11.5/love-11.5-win64.zip
	unzip -q temp/love-win64.zip -d temp
	rm -f temp/love-win64.zip temp/love-11.5-win64/*.txt temp/love-11.5-win64/*.ico temp/love-11.5-win64/lovec.exe
	cat temp/love-11.5-win64/love.exe out/boss-baller.love > temp/love-11.5-win64/boss-baller.exe
	rm -f temp/love-11.5-win64/love.exe
	cd temp/love-11.5-win64 && zip -rq boss-baller_win64.zip boss-baller.exe *.dll
	mv temp/love-11.5-win64/boss-baller_win64.zip out
	rm -rf temp

clean:
	rm -rf out
	rm -rf temp