//states
oldj='';
//var maintg is defined from call

function pr(d){return console.log(d);}
function und(d){return typeof d=='undefined'?'':d;}
function getbyid(id){return document.getElementById(id);}
function falseClose(id){getbyid(id).innerHTML='';}

function active(ob,id,a){if(id)ob=getbyid(id); var op=ob.className;
if(op.indexOf('active')==-1){ob.classList.add("active"); return 1;}
else if(!a){ob.classList.remove("active"); return 0;}}
function isactive(ob,id){if(id)ob=getbyid(id); var op=ob.className;
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

function togjs(id){var ob=getbyid(id);
if(active(ob))ob.className="hidden"; else ob.className="block";}

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
window.setSelectionRange(tg,slctstart,finalend);
tg.scrollTop=slcttop;
tg.focus();
return s2;}

//capt
function setSelectionRange(input,selectionStart,selectionEnd){
if(input.setSelectionRange){input.focus();
	input.setSelectionRange(selectionStart,selectionEnd);}
else if(input.createTextRange){
	var range=input.createTextRange();
	range.collapse(true);
	range.moveEnd('character',selectionEnd);
	range.moveStart('character',selectionStart);
	range.select();}}

function storeCaret(textEl){//insert at Caret position
if(textEl.createTextRange)textEl.caretPos=document.selection.createRange().duplicate();}

//getrange
function getrange(id){
var ob=getbyid(id);
elStart=0; elEnd=0;
var doc=ob.ownerDocument||ob.document;
var win=doc.defaultView||doc.parentWindow;
var sel;
if(typeof win.getSelection!="undefined"){
	sel=win.getSelection(); //sel=encode_utf8(sel);
	if(sel.rangeCount>0){
		var range=win.getSelection().getRangeAt(0);
		var preCaretRange=range.cloneRange();
		preCaretRange.selectNodeContents(ob);
		preCaretRange.setEnd(range.endContainer,range.endOffset);
		elEnd=preCaretRange.toString().length;}}
else if((sel=doc.selection) && sel.type!="Control"){
	var textRange=sel.createRange();
	var preCaretTextRange=doc.body.createTextRange();
	preCaretTextRange.moveToElementText(ob);
	preCaretTextRange.setEndPoint("EndToEnd",textRange);
	elEnd=preCaretTextRange.text.length;}
slct=sel.toString();
if(slct.substring(slct.length-1,slct.length)==' '){slct=slct.substring(0,slct.length-1); elEnd-=1;}
var elStart=elEnd-slct.length;
return{start:elStart,end:elEnd,txt:slct};}

//unused
function insert_html(t,id){var ob=getbyid(id);
var range=window.getSelection().getRangeAt(0);
if(range.startContainer.nodeType===Node.TEXT_NODE){
range.startContainer.insertData(range.startOffset,t);}}

//action on dblclick
function useslct(e,id){var d=getrange('art'+id);
if(d.txt){var ex=getbyid('edtrk'+id);
	if(ex)insert('['+d.txt+'|'+d.start+':callquote]'+"\n\n",'edtrk'+id);
	else ajaxcall('popup','tracks,form',[id,d.txt,d.start],[],'');}}

//target a position
function callquote(id,s,pad,idt){
var ob=getbyid('art'+id); var t=ob.innerHTML;
ajaxcall('art'+id,'art,playq',[id,s,pad,idt],[],'');
setTimeout(function(){scrolltoob('qnh'+s,200)},300);}

function xltags(e,id,cnn){var d=getrange('art'+id);
if(d.txt){var tg=cnn=='all'?'popup':'art'+id; if(cnn=='all')cnn='';
	//var ob=getbyid('art'+id); var t=ob.innerHTML;
	//var s1=t.substr(0,d.start); var s2=t.substr(d.start,d.end-d.start); var s3=t.substr(d.end);
	//ob.innerHTML=s1+'<span id="slct1'+id+'"></span>'+s2+'<span id="slct2'+id+'"></span>'+s3;
	ajaxcall(tg,'mk,slctconn',[id,d.txt,d.start,cnn],[],'');}}

//toggle bt
function liul(el){var a=active(el);
var ul=el.nextSibling;
ul.className=a?'on':'off';}

function val2html(id,to){getbyid(id).innerHTML=getbyid(id).value;}

//setInterval
function Timer(func,id,start,end,t){var timer=0;
if(typeof id==='undefined'||id=='')return;
if(start>end){for(i=start;i>=end;i--){timer++; curi=i;
	x=setTimeout(func+"("+i+",'"+id+"')",timer*t);}}
else if(start<end){for(i=start;i<=end;i++){timer++;
	x=setTimeout(func+"("+i+",'"+id+"')",timer*t);}}}

//popups
function zindex_sup(){
getbyid('pop'+curid).style.zIndex=popz+100;}
function zindex(id){popz++; curid=id;
getbyid('pop'+id).style.zIndex=popz;}

function innerW(){return parseInt(window.innerWidth);}
function innerH(){return parseInt(window.innerHeight);}

(function(w,u,o){w.selectable=function(a,b){
	if(typeof b==='boolean' && !b){a.setAttribute(u,'on');a.setAttribute(o,'return false;');}
	else{if(a.hasAttribute(u))a.removeAttribute(u); if(a.hasAttribute(o))a.removeAttribute(o);}}})
(window,'unselectable','onselectstart');

//close bub
function clbub(op,bid){var div=getbyid('clbub');
if(op){addEvent(div,'mousedown',function(){clbub(0,bid)});
	div.style.width='100%'; div.style.height='100%';}
else{div.style.width=0; div.style.height=0;
	if(bid)Hide(bid); else{var bub=getbyid('bub');
	active_list_bubble(bub); global_actlistbub();}}}
//close popbub
function clpop(e,id){var n=clp.length; var fix='';
if(id)clp[n]=id; else if(n){if(e)var m=mouse(e); else m={x:0,y:0};
	for(i=0;i<n;i++){if(clp[i]){var bub=getbyid(clp[i]); if(bub){
		var p=getPosition(bub); var top=p.y; var fix=infixed(bub);
		//if(fix){var scr=pageYOffset; top+=scr;}//not relative parent
		if(fix){var scr=scrollinpos(bub); var scb=pageYOffset; top-=scr-scb; var my=m.y-scb;}
		else{var scr=0; var scb=0; var my=m.y;}
		if(m.x<p.x||m.x>(p.x+p.w)||my<top||my>(top+p.h)){//clickoutside
			if(clp[i].substr(0,3)=='pub')cltog(clp[i]);
			else if(clp[i].substr(0,2)=='bb')closechild(bub);
			else Remove(clp[i]);
			clp[i]=undefined;}}}}}}
//close togbub
function cltog(d){var op=getbyid(d); if(op)var ob=op.parentNode; Remove(d);
if(ob){var oa=ob.getElementsByTagName("a")[0]; activeob(oa);}}

//drag
function start_drag(ev,z){
popup=getbyid('pop'+z); cpop=popup;
old_mousep=mouse(ev);
old_mousex=getPosition(popup);
cpop_difx=old_mousep.x-old_mousex.x;
cpop_dify=old_mousep.y-old_mousex.y;}
function stop_drag(ev){cpop=0;}

function mouse(ev){if(ev.pageX||ev.pageY){return {x:ev.pageX,y:ev.pageY};}
return{x:ev.clientX+document.body.scrollLeft-document.body.clientLeft,
	y:ev.clientY+document.body.scrollTop-document.body.clientTop};}

function popslide(ev){
if(cpop!=0){var souris=mouse(ev);
	cpop.style.left=(souris.x-cpop_difx)+'px';
	cpop.style.top=(souris.y-cpop_dify)+'px';}}

function getPosition(e){if(e==null)return {x:0,y:0,w:0,h:0};
var left=0; var top=0; var w=e.offsetWidth; var h=e.offsetHeight;
while(e.offsetParent){left+=e.offsetLeft; top+=e.offsetTop; e=e.offsetParent;}
left+=e.offsetLeft; top+=e.offsetTop; return {x:left,y:top,w:w,h:h};}
function get_dim(e){
return {x:e.offsetLeft,y:e.offsetTop,w:e.offsetWidth,h:e.offsetHeight};}

//divs
function falseClose(val){getbyid(val).innerHTML='';}
function popclose(){var pp=getbyid('popup'); var ppa=getbyid('pop'+curid); if(ppa)pp.removeChild(ppa); curid=0;}
function removechild(val){var e=getbyid(val); if(e){var a=e.parentNode; if(a)a.removeChild(e);}}
function display(val){getbyid(val).style.display='block';}
function hide(val){getbyid(val).style.display='none';}