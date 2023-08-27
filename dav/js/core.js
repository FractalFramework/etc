//app
//var maintg is defined from call

//save
function editarea(el,op){var act=active('',el);
    if(act)var pr={'edt':'true','dsg':'on'};
    else var pr={'edt':'false','dsg':'off'};
    el.contentEditable=pr.edt; el.designMode=pr.dsg;
    if(act){void 0; el.focus();}}

function editxt(el,id){
    var act=isactive('',el);
    if(!act)editarea(el,1);}

function savtxt(el,id,op=0){var tg=el.id;
	bjcall(tg+'|posts,update|id='+id+',col='+tg+'|val='+tg);
	if(!op)editarea(el,0);}

function editbt(tg,id,op){
    var el=getbyid(tg);
    var bt=getbyid("bt"+id);
	if(bt.rel==1 && !op){bt.rel=0;
		savtxt(el,id);
		getbyid("editbt").style.display="none";}
	else if(bt.rel==0){bt.rel=1;
        bjcall(tg+'|posts,content|id='+id);
        bjcall('editbt|conns,bt|bt=1,id='+id);
		editarea(el,1); void 0; el.focus();
		getbyid("editbt").style.display="inline-block";}}
