let httpRequest; wait=0; x=0;
var popz=1;
var cpop=0;
var cpop_difx=0;
var cpop_dify=0;
var popnb=0;
var curid=0;
var exs=[];//artlive
const url='/ajax.php?com=';
//var maintg is defined from call

//output
function ajax_callback(tg,act){
if(httpRequest.readyState===XMLHttpRequest.DONE){
	if(httpRequest.status===200){wait=0; clearTimeout(x);
		var res=httpRequest.responseText;
		var cb=getbyid(tg);
		if(act=='json')jsonput(tg,res);
		else if(tg=='popup')popub(res,act);
		else if(tg=='pagup')pagup(res,act);
		else if(tg=='panup')panup(res,act);
		else if(tg=='bubble')bubble(res,act);
		else if(tg=='togbub')togbub(res,act);
		else if(cb!=null){var type=cb.type;
			if(type=='text'||type=='hidden'||type=='textarea')cb.value=res;
			else cb.innerHTML=res;}}
	else{
		if(httpRequest.onError!=undefined){
			httpRequest.onError({status:httpRequest.status,
			statusText:httpRequest.statusText});}}
		delete httpRequest;}
//else if(wait==0){wait=1; x=setTimeout('waitmsg(tg)',1000); opac(10,tg);}
}

function addEvent(obj,event,func){if(obj!=undefined)obj.addEventListener(event,func,true);}
function opac(op,id){if(id!=null){var ob=getbyid(id); if(ob!=undefined)ob.style.opacity=(op/100);}}

function ajax_req(tg,action,fd,pp,act){
httpRequest=new XMLHttpRequest();
if(!httpRequest){pr('error httprequest'); return false;}
httpRequest.onreadystatechange=function(){ajax_callback(tg,act);}
httpRequest.open('POST',url+action+pp,true);
httpRequest.send(fd);}

//json	
function jsonput(keys,json){var cb,k,typ,tg;
var obj=JSON.parse(json);
var rk=keys.split(','); var i=0; var rkx=rk.length>1?1:0;
for(var k in obj){
	tg=rk[i]?rk[i]:k; i++;
	cb=getbyid(tg);
	if(cb!=null)typ=cb.type;
	if(typ=='text'||typ=='textarea'||typ=='hidden')cb.value=obj[k];
	else if(cb!=null)cb.innerHTML=obj[k];}}

//frct
//target,tg2|app,mth|var1,var2|inp1,inp2 //tg;a;act;g;p
function bj(ob){var val=ob.dataset.bj; bjcall(val);}
function bjcall(val){//if(typeof x!='undefined')clearTimeout(x);
var dn=val.split('|'); var fd=new FormData();
var pp='&_tg='+dn[0]; var act='';
if(dn[0].indexOf(',')!=-1)act='json';
if(dn[1].indexOf('/')!=-1){var url=dn[1]; var sn=dn[1].split('/');
	dn[1]=sn[0]+',call'; dn[2]='a='+sn[1]; if(sn[2])dn[2]+='b='+sn[2]; updateurl(url,dn);}
if(dn[2]){prm=dn[2].split(','); for(i=0;i<prm.length;i++){var p=prm[i].split('='); fd.append(p[0],p[1]);}}
if(dn[3]){prm=dn[3].split(','); for(i=0;i<prm.length;i++){var p=prm[i].split('='); fd.append(p[1]?p[0]:prm[i],capture(p[1]?p[1]:prm[i]));}}
ajax_req(dn[0],dn[1],fd,pp,act);}

function bg(ob){var j=ob.dataset.bj; var act=active(ob); var dn=j.split('|');
if(act)bjcall(j); else falseClose(dn[0]);}

function bh(o){var com=o.href; var r=com.split('/');
//if(r[3].indexOf('#')!=-1){var rd=r[3].split('#'); r[3]=rd[0];}// var diez='#'+rd[1];
var j=maintg+'|a='+und(r[3])+',b='+und(r[4])+',c='+und(r[5])+',d='+und(r[6]);
bjcall(j);
updateurl(com,j);
return false;}

function bjtog(id,j){var ob=getbyid(id);
if(active(ob))bjcall(id+'|'+j); else ob.innerHTML="";}

//inputs
function capture(tg){var ty,vl,type='';
var ob=getbyid(tg); if(ob==null)ob=document.getElementsByName(tg)[0]; if(ob==null)return;
var ty=ob.type; if(ty)var type=ty.split('-')[0]; 
if(type=='checkbox')vl=ob.checked?1:0;
else if(type=='select')vl=ob.selectedIndex!=-1?ob.options[ob.selectedIndex].value:'';
else if(type=='radio'){var el=document.getElementsByName(tg);
	for(var io=0;io<el.length;io++)if(el[io].checked)vl=el[io].value;}
else if(ty==undefined && ob!=null){vl=ob.innerHTML;}// localStorage['revert']=vl;
else if(ob!=null)vl=ob.value;
return vl;}

//forms
function capture_element(ob){
var ty=ob.type.split('-')[0];
if(ty=='text' || ty=='number')return {name:ob[i].name,value:ob[i].value};
else if(ty=='select')return {name:ob[i].name,value:ob[i].options[ob[i].selectedIndex].value};}

function captureform(name){
var ob=document.forms[name];
var fd=new FormData();
if(ob)for(i=0;i<ob.length;i++){
	var res=capture_element(ob[i]);
	fd.append(res.name,res.value);}
return fd;}

function sendform(tg,action,form){
if(form)var fd=captureform(form);
ajax_req(tg,action,fd);}

//popup
function poph(popu,pageup,thin){if(popu==null)return;
popu.style.maxHeight=''; var adjust=60;
var ha=innerH(); var hb=popu.offsetHeight;
if(hb>ha){
	if(pageup)popu.style.height='calc(100vh - '+popa.offsetHeight+'px)';//36
	else popu.style.maxHeight=(ha-adjust)+'px';
	popu.style.overflowY='scroll'; if(thin)popu.style.scrollbarWidth='thin';}
else{popu.style.overflowY='auto';}
popu.style.maxWidth='';
var wa=innerW(); var wb=popu.offsetWidth;
if(wb>wa){
	if(pageup)popu.style.width='100vw';
	else popu.style.maxWidth=wa+'px';
	popu.style.overflowX='visible'; if(thin)popu.style.scrollbarWidth='thin';}
else popu.style.overflowX='auto';}

function poprepos(){//popnb;
if(getbyid('popu'+curid)==undefined)return;
var popu=getbyid('popu'+curid); poph(popu,'',1);
var popup=getbyid('pop'+curid);
var pos=ppos(popu,0);
popup.style.left=pos.x+'px'; popup.style.top=pos.y+'px';}

function autoscroll(popu){
var p=getPosition(popu); var is=inpopup(popu); var ha=is?is.offsetHeight:innerH();
var sc=scrollinpos(popu.parentNode); //pr(ha+'-'+sc+'-'+p.y+'-'+p.h+'-'+is.id);
if(p.y+p.h>(ha+sc)){var nh=(ha+sc)-p.y-20; if(nh>440)nh=440; if(nh<100)nh=140;
var iscroll=popu.getElementsByClassName('scroll');
if(iscroll.length==0){popu.style.maxHeight=nh+'px'; popu.style.overflowY='scroll'; popu.style.overflowX='hidden'; popu.style.scrollbarWidth='thin';}}}

function ppos(popu,decal){if(popu==null)return;
var sw=innerW(); var w=popu.offsetWidth; var l=(sw-w)/2-20;
var sh=innerH(); var h=popu.offsetHeight; var t=(sh-h)/2-20;
if(l+decal+w>sw)decal=0; var px=(l>0?l:0)+decal; if(px<10)px=0;
if(t+decal+h>sh)decal=0; var py=(t>0?t:0)+decal;
return {x:px,y:py};}

function popub(res,act){popnb+=1;
var nb=popnb; var ab,as=''; var decal=0;
var content=getbyid('popup');
var popup=document.createElement('div');
popup.id='pop'+nb; popup.style.position='fixed';
addEvent(popup,'mousedown',function(){zindex(nb)});
popup.innerHTML=res;
content.appendChild(popup); zindex(nb);
var popa=getbyid('popa');
addEvent(popa,'mousedown',function(event){start_drag(event,nb); selectable(popa,false);});
addEvent(popa,'mouseup',function(event){stop_drag(event); selectable(popa,true);});
var popu=getbyid('popu'); poph(popu);//before ppos
var pos=ppos(popu,decal);
if(pos){popup.style.left=pos.x+'px'; popup.style.top=pos.y+'px';}
if(as)autoscroll(popu);
popa.id='popa'+nb; popu.id='popu'+nb;}

function poprepos(){//popnb;
if(getbyid('popu'+curid)==undefined)return;
var popu=getbyid('popu'+curid); poph(popu,'',1);
var popup=getbyid('pop'+curid);
var pos=ppos(popu,0);
popup.style.left=pos.x+'px'; popup.style.top=pos.y+'px';}

var nbw=0;
function reduce(){//popup_reduce
var pp=getbyid('pop'+curid);
var po=getbyid('popu'+curid); var ob=po.style.display;
//var pa=getbyid('popa'+curid); var obb=po.style.display;
if(ob=='block'||!ob){po.style.display='none'; nbw+=1; //pa.style.display='none';
	var pos=getPosition(pp); pp.dataset.x=pos.x; pp.dataset.y=pos.y;
	var top=innerH()-(nbw*pp.offsetHeight); var left=0;}//pp.style.top=top+'px'; pp.style.left=left+'px';
else{po.style.display='block'; nbw-=1;}}//setTimeout(function(){poprepos()},200);
	//pp.style.left=pp.dataset.x+'px'; pp.style.top=pp.dataset.y+'px';

//pagup
function pagpos(){
var popup=getbyid('pop'+curid);
//popup.style.left=0; popup.style.top=0;
popup.style.width='calc(100vw - 16px)';
popup.style.height='100%';popup.style.left='0';
popup.style.top='0'; popup.style.bottom='0';
popup.style.backgroundColor='rgba(0,0,0,0.7)';
popup.style.boxShadow='0px 0px #000;';}

function pagup(res,method){popnb+=1; var nb=popnb;
var content=getbyid('popup');
var popup=document.createElement('div');
popup.id='pop'+nb; popup.style.position='fixed';
addEvent(popup,'mousedown',function(){zindex(nb)});
popup.innerHTML=res;
content.appendChild(popup); zindex(nb); //clpop('','pop'+nb);
var popu=getbyid('popu');
poph(popu,1);//before ppos
pagpos();
popu.id='popu'+nb;}

//bubbles
function active_list_bubble(ul){var li=ul.getElementsByTagName("li"); //change
if(li.length>0)for(i=0;i<li.length;i++){var liul=li[i].getElementsByTagName("ul");
	li[i].className=''; if(liul[0]){liul[0].style.display='none';}}}
function global_actlistbub(){var bubs=getbycss('inline');
for(var i=0;i<bubs.length;i++)active_list_bubble(bubs[i]);}
function findparentbub(ob){var pbub=ob.parentNode; if(pbub==null)return ob;
if(pbub.className=='inline')return pbub; else return findparentbub(pbub);}
function closeotherbubs(ob){
var bubs=getbycss('inline'); var not=findparentbub(ob);
for(var i=0;i<bubs.length;i++)if(bubs[i]!=not)active_list_bubble(bubs[i]);}
function closechild(li){var ul=li.getElementsByTagName("ul"); //desactive
for(i=0;i<ul.length;i++){ul[i].style.display='none';}}
function closebub(e){active_list_bubble(e.parentNode); eb=e.parentNode.parentNode;//btn
if(eb.parentNode)setTimeout(function(){closebub(eb)},100); else clbub(0,'');}
function closepbub(e,id){var pbu=e.parentNode.parentNode; active_list_bubble(pbu);
var li=pbu.getElementsByTagName("li");//if(id)e.parentNode.id=id;
for(i=0;i<li.length;i++){if(li[i]==e.parentNode && li[i].id)li[i].className='active';
	else li[i].className='';}}

function bubpos(bub,id,li,liul){var indic=id.substr(0,1);
if(indic=='d'){var tw=innerW(); var pos=getPosition(li);
	var left=li.offsetLeft; bub.style.minWidth='200px'; //bub.style.maxWidth='340px';
	bub.style.top=li.parentNode.offsetTop+li.parentNode.offsetHeight+'px';
	if(liul[0])var wei=liul[0].offsetWidth; else var wei=bub.offsetWidth;
	if(left+wei>tw)left=tw-wei-li.parentNode.offsetLeft;
	bub.style.left=left+'px';}
else{var th=innerH(); var top=li.offsetTop; var lih=li.parentNode.offsetTop;
	bub.style.left=li.offsetLeft+li.offsetWidth+'px';
	if(liul[0])var hei=liul[0].offsetHeight; else var hei=bub.offsetHeight;
	if(top+hei>th){top=th-hei-lih; if(top<0)top=0;
		bub.style.minWidth='180px'; //bub.style.maxWidth='480px';
		bub.style.maxHeight=(th-top-100)+'px'; //alert(th+'-'+top);
		bub.style.overflowY='auto'; bub.style.overflowX='hidden'; popu.style.scrollbarWidth='thin';}
	bub.style.top=top+'px';}}

function bubopac(op,id){var li=getbyid(id);
var liul=li.getElementsByTagName('ul'); liul[0].style.opacity=(op/100);}

function bubble(res,id){clbub(1,'');//onclickout
var idb='bb'+id; var li=getbyid(idb); li.style.zIndex=popz+1;
var liul=li.getElementsByTagName('ul');
var bub=document.createElement('ul');
if(id.substr(0,1)=='c')bub.className='nob';
if(li.className=='active'){li.className=''; closechild(li);}
else{closeotherbubs(li.parentNode); active_list_bubble(li.parentNode);
	bub.style.position='absolute'; popz+=1;
	if(liul[0]){//aex
		liul[0].style.display='block'; liul[0].style.zIndex=popz;
		liul[0].innerHTML=res; poph(liul[0],'',1); li=liul[0]; bub=liul; idb=liul[0].id;}
	else{bub.innerHTML=res; li.appendChild(bub); (li.parentNode).style.zIndex=popz;}
	//bubopac(0,idb); Timer('bubopac',idb,10,100,2);
	bubpos(bub,id,li,liul);}}

//togbub
function togbub(res,id){popnb+=1; popz+=100;
var div=getbyid('bt'+id); var pos=get_dim(div); //var pid='pop'+popnb;
div.style.position='relative';//parent need to be relative
var bub=document.createElement('div'); bub.innerHTML=res; bub.style.zIndex=popz;
bub.className='popup'; bub.style.position='absolute';
bub.style.minWidth='270px'; bub.style.maxWidth='500px'; bub.style.lineHeight='normal';
bub.style.padding='4px'; bub.style.marginRight='4px'; bub.id='pub'+id;
div.appendChild(bub); bub.style.left=(0-pos.x)+'px';//to measure width
var pob=get_dim(bub); var mxw=innerW(); var bsl=0;
if(pos.x+pob.w>mxw)bsl=pos.w-pob.w;
if(bsl<-pos.x)bsl=-pos.x;
bub.style.left=bsl+'px';
var e=infixed(div); if(e){var poc=get_dim(e); var nx=bsl;
	if(pos.x+pob.w>poc.w)bub.style.left=(pos.w-pob.w)+'px';}
autoscroll(bub); clpop('','pub'+id);}
