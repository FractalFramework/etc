let httpRequest; wait=0;
const url='/ajax.php?com=';
//var maintg is defined from call

//output
function ajax_callback(target,tp){
if(httpRequest.readyState===XMLHttpRequest.DONE){
	if(httpRequest.status===200){wait=0;
		var res=httpRequest.responseText;
		var cb=getbyid(target);
		if(tp=='json'||target=='json')jsonput(target,res);
		else if(cb!=null){var type=cb.type;
			if(type=='text'||type=='hidden'||type=='textarea')cb.value=res;
			else cb.innerHTML=res;}
	}	
	else{
		if(httpRequest.onError!=undefined){
			httpRequest.onError({status:httpRequest.status,
			statusText:httpRequest.statusText});}}
		delete httpRequest;
	}
//else if(wait==0){wait=1; waitmsg(target); opac(10,target);}
}

function ajax_req(target,action,fd,pp,tp){
httpRequest=new XMLHttpRequest();
if(!httpRequest){pr('error httprequest'); return false;}
httpRequest.onreadystatechange=function(){ajax_callback(target,tp);}
httpRequest.open('POST',url+action+pp,true);
httpRequest.send(fd);}

//frct
//target,tg2|app,mth|var1,var2|inp1,inp2 //tg;a;tp;g;p
function bj(ob){var val=ob.dataset.bj; bjcall(val);}
function bjcall(val){//if(typeof x!='undefined')clearTimeout(x);
var dn=val.split('|'); var fd=new FormData();
var pp='&_tg='+dn[0]; var tp='';
if(dn[0].indexOf(',')!=-1)tp='json';
if(dn[1].indexOf('/')!=-1){var url=dn[1]; var sn=dn[1].split('/');
	dn[1]=sn[0]+',call'; dn[2]='a='+sn[1]; if(sn[2])dn[2]+='b='+sn[2]; updateurl(url,dn);}
if(dn[2]){prm=dn[2].split(','); for(i=0;i<prm.length;i++){var p=prm[i].split('='); fd.append(p[0],p[1]);}}
if(dn[3]){prm=dn[3].split(','); for(i=0;i<prm.length;i++){var p=prm[i].split('='); fd.append(p[1]?p[0]:prm[i],capture(p[1]?p[1]:prm[i]));}}
ajax_req(dn[0],dn[1],fd,pp,tp);}


function bjtog(ob){var j=ob.dataset.bj; var act=active('',ob); var dn=j.split('|');
if(act)bjcall(j); else falseClose(dn[0]);}

function bh(o){var com=o.href; var r=com.split('/');
//if(r[3].indexOf('#')!=-1){var rd=r[3].split('#'); r[3]=rd[0];}// var diez='#'+rd[1];
var j=maintg+'|a='+und(r[3])+',b='+und(r[4])+',c='+und(r[5])+',d='+und(r[6]);
bjcall(j);
updateurl(com,j);
return false;}

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

//json
function jsonput(keys,json){var cb,k,typ;
var rk=keys.split(',');
var obj=JSON.parse(json);
for(var i in obj){
	if(i>-1)k=rk[i]; else k=i;
	cb=getbyid(k);
	if(cb!=null)typ=cb.type;
	if(typ=='text'||typ=='textarea'||typ=='hidden')cb.value=obj[i];
	else if(cb!=null)cb.innerHTML=obj[i];}}

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

function sendform(target,action,form){
if(form)var fd=captureform(form);
ajax_req(target,action,fd);}
