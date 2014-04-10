lastScrollY=0;
function heartBeat(){
var diffY;
if (document.documentElement && document.documentElement.scrollTop)
diffY = document.documentElement.scrollTop;
else if (document.body)
diffY = document.body.scrollTop
else
{}
percent=.1*(diffY-lastScrollY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.getElementById("ALayer1").style.top=parseInt(document.getElementById("ALayer1").style.top)+percent+"px";

lastScrollY=lastScrollY+percent;
}
document.write(suspendcode12);
window.setInterval("heartBeat()",1);
function closeBanner()
{
document.getElementById("ALayer1").style.display= 'none';
}