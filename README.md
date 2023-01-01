# antmediaserver
## install_ant-media-server.sh
`install_ant-media-server.sh` is same as official one except I
Modified `AMS_BASE` and `BACKUP_DIR` dir location to `/home/app/` because  /usr/local/antmedia` throws "can not move file .... : device busy"


## Steps:

* Download the latest binary from https://github.com/ant-media/Ant-Media-Server/releases

That may be a zip file.
* Then first build docker image using command
`docker-compose build --build-arg AntMediaServer=ant-media-server-community-2.5.1.zip` replace last part, that is, the file name with the file you downloaded.

* finally run `docker-compose up -d`

* now you should be able to access your antmedia server at default port `5080` eg: `localhost:5080` or your &lt;IP&gt;:5080 
* Thats all rest follow the guide here. https://resources.antmedia.io/docs/docker-and-docker-compose-installation

