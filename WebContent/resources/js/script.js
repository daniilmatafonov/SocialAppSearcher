function showAdditionalFields()
{
	$('#s_attr').click(function(){
    	if($(this).attr('checked'))
    		$(".fields").css( "display", "block !important");
    		else
    			$(".fields").css( "display", "none");    
    });
}