<script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function() {
	$( ".Wdate" ).click(function(){
		WdatePicker();
	});
	$( ".Wdate" ).focus(function(){
		WdatePicker();
	});
});
</script>



