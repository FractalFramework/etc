//states
oldj='';

function pr(d){return console.log(d);}
function und(d){return typeof d=='undefined'?'':d;}
function getbyid(id){return document.getElementById(id);}
function falseClose(id){getbyid(id).innerHTML='';}

function active(id,ob,a){if(id)ob=getbyid(id); var op=ob.className;
if(op.indexOf('active')==-1 && !a){ob.classList.add("active"); return 1;}
else{ob.classList.remove("active"); return 0;}}

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
var j=jbase+'|a='+a+',b='+und(st.b)+',c='+und(st.c);
var r={u:u,j:j,t:t};
var h=window.location.hash;
//if(h){h=decodeURIComponent(h.substring(1)); var i=rha.get(h); r={u:u,j:j,t:t,i:i};}
window.history.replaceState(r,j,u);}
    
//window.addEventListener('popstate',function(e){restorestate(e.state);});
window.onpopstate=function(e){restorestate(e.state);}
window.onload=function(e){startstate(state);}
