//states
oldj='';
//var maintg is defined from call

function pr(d){return console.log(d);}
function und(d){return typeof d=='undefined'?'':d;}
function getbyid(id){return document.getElementById(id);}
function falseClose(id){getbyid(id).innerHTML='';}

function active(id,ob,a){if(id)ob=getbyid(id); var op=ob.className;
if(op.indexOf('active')==-1){ob.classList.add("active"); return 1;}
else if(!a){ob.classList.remove("active"); return 0;}}
function isactive(id,ob){if(id)ob=getbyid(id); var op=ob.className;
return op.indexOf('active')==-1?0:1;}

//urls
function updateurl(u,j){
var r={u:u,j:j,t:''};
if(j!=oldj)window.history.pushState(r,j,u); oldj=j;
if('scrollRestoration' in history)history.scrollRestoration='manual';}

function restorestate(st){if(!st)return;
bjcall(st.j); document.title=st.t;}

function startstate(st){
var u=document.URL; var t=document.title;
var a=und(st.a); if(!a)a='home';
var j=maintg+'|a='+a+',b='+und(st.b)+',c='+und(st.c)+',dc='+und(st.d);
var r={u:u,j:j,t:t};
var h=window.location.hash;
//if(h){h=decodeURIComponent(h.substring(1)); var i=rha.get(h); r={u:u,j:j,t:t,i:i};}
window.history.replaceState(r,j,u);}
    
//window.addEventListener('popstate',function(e){restorestate(e.state);});
window.onpopstate=function(e){restorestate(e.state);}
window.onload=function(e){startstate(state);}

//tabs
function tabs(id,n){
var mnu=getbyid('mn'+id).getElementsByTagName("a");
for(i=0;i<mnu.length;i++){var b=i+1;
    if(b==n){mnu[i].parentNode.className='active'; getbyid('div'+id+b).style.display='block';}
    else{mnu[i].parentNode.className=''; getbyid('div'+id+b).style.display='none';}}}

//edit
function execom(d){var u=null; if(d=='createLink')u=prompt('Url'); document.execCommand(d,false,u);}
function execom2(d){document.execCommand('formatBlock',false,'<'+d+'>'); getbyid('wygs').value='no';}

//slct
function insert(text,id){var tg=getbyid(id);
if(tg.createTextRange && tg.caretPos){var caretPos=tg.caretPos;
	caretPos.text=caretPos.text+text+caretPos.text.charAt(caretPos.text.length-1);}
 else mozWrap('',text,id);}
 
function embed(start,end,id){
var tg=getbyid(id); tg.focus(); var slctd=false; pr(tg.selectionEnd);
if(tg.selectionEnd && (tg.selectionEnd-tg.selectionStart>0)){
	slctd=mozWrap(start,end,id); return slctd;}}

function mozWrap(opn,clo,id){
var s1=''; var s2=''; var s3='';
var tg=getbyid(id); var vl=1;//
if(typeof tg.value==='undefined')var vl=0;
var slctlen=tg.textLength;
var slctstart=tg.selectionStart;
var slctend=tg.selectionEnd;
var slcttop=tg.scrollTop;
if(slctend==1||slctend==2)slctend=slctlen;
if(vl)var truend=(tg.value).substring(slctend-1,slctend);
if(slctend-slctstart>0 && truend==' ')slctend=slctend-1;
if(slctend-slctstart>0 && truend=="\n")slctend=slctend-1;
if(vl)var s1=(tg.value).substring(0,slctstart);
	else var s1=(tg.innerHTML).substring(0,slctstart);
if(vl)var s2=(tg.value).substring(slctstart,slctend);
if(vl)var s3=(tg.value).substring(slctend,slctlen);
if(vl)tg.value=s1+opn+s2+clo+s3;
else tg.innerHTML=s1+opn+s2+clo+s3;
finalend=slctend+clo.length+opn.length;
if(!s2)slctstart=finalend;
//window.setSelectionRange(tg,slctstart,finalend);
tg.scrollTop=slcttop;
tg.focus();
return s2;}

//toggle bt
function liul(el){var a=active('',el);
var ul=el.nextSibling;
ul.className=a?'on':'off';}