$(function(){
	$("[name='pageSize']").change(function(){

		let frm = $("[name='frmPageRows']");
		frm.attr("method", "POST");
		frm.attr("action", conPath+"/board/pageSize.bo");
		frm.submit();
	});
});