$(function (){
		
	var dateFormat = "yy-mm-dd", 
	from = $('.datepicker1').datepicker({
		defaultDate : "+1w",
		dateFormat: 'yy-mm-dd',
		changeMonth:true,
	    autoclose: true,
	    todayHighlight: true,
	    language: "kr",
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true
		
	})
	.on("change", function (){
		to.datepicker("option", "minDate", getDate(this));
	}),
	to = $('.datepicker2').datepicker({
		defaultDate : "+1w",
		dateFormat: 'yy-mm-dd',
		changeMonth:true,
	    autoclose: true,
	    todayHighlight: true,
	    language: "kr",
	    showOtherMonths: true,
	    selectOtherMonths: true,
	    showButtonPanel: true
	})
	.on("change", function(){
		from.datepicker("option", "maxDate", getDate(this));
	});
	
	
	function getDate(element){
		var date;
		try{
			date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	
});
