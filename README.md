<p align="center">
  <img src="https://theia-ide.org/static/theia-logo-edited-a5310c78563e0592df22c555efd7d215.svg" height="200" />
</p>

What is THEIA?
--------------

Cloud & Desktop IDE Platform

Eclipse Theia is an extensible platform to develop multi-language Cloud & Desktop IDEs with state-of-the-art web technologies.

For more information and related downloads for THEIA, please visit <https://theia-ide.org>.

Supported Tags and Respective Dockerfile Links
----------------------------------------------

-   THEIA (tag: [`latest`](https://github.com/devzolo/docker-theia/blob/master/Dockerfile)) ([devzolo/theia/Dockerfile](https://github.com/devzolo/docker-theia/blob/master/Dockerfile))

How to Use the THEIA Images
---------------------------

### Downloading a THEIA Docker Image

Downloading the server image in a separate step is not strictly necessary; however, performing this before you create your Docker container ensures your local image is up to date.

To download the THEIA image, run this command:

    shell> docker pull devzolo/theia:tag
&nbsp;
Refer to the list of supported tags above. If `:tag` is omitted, the `latest` tag is used, and the image for the latest version of THEIA is downloaded.
