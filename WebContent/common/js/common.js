//<![CDATA[
/**동기식아작스선언*/
jQuery.extend({
	syncPost: function(url, data, callback, type, async) {
		if (jQuery.isFunction(data)) {
			callback = data;
			data = {};
		}
		return jQuery.ajax({
			type: "POST",
			url: url,
			data: data,
			success: callback,
			dataType: type,
			async: async
		});
	}
});

$(document).ready(function($) {
	
	/**AES 256bit 암호화*/
	window.AESEncode = function(txt, key) {
		GibberishAES.size(128);	
		return GibberishAES.aesEncrypt(txt, key);
	};
	
	/**폼가져오기*/
	window.getForm = function() {
		return document.form;
	};
	
	window.getByName = function(obj) {
		return document.getElementsByName(obj);
	};
	
	/**폼서브밋(POST)*/
	window.POST = function(action) {
		getForm().action = action;
		getForm().method = "POST";
		getForm().submit();
	};
	
	/**폼서브밋(GET)*/
	window.GET = function(action) {
		getForm().action = action;
		getForm().method = "GET";
		getForm().submit();
	};
	
	/** setValue */
	window.setValue = function(obj, val) {
		obj.value = val;
	};
	
	/** 실행변경(POST) */
	window.postExecute = function(command) {
		setValue(getForm().command, command);
		POST(getForm().action);
	};
	
	/** 실행변경(GET) */
	window.getExecute = function(command) {
		var params = window.location.href.split("?")[1];
		var param = (params)?params.split("&"):"";
		var queryString = "";
		if (param.length > 0) {
			for (var i=0;i<param.length;i++) {
				if (param[i].split("=")[1] != "") {
					if (param[i].indexOf("command=") != 0) queryString += (!queryString)?"?"+param[i]:"&"+param[i];
					else queryString += (!queryString)?"?command="+command:"&command="+command;
				}
			}
			if (queryString.indexOf("command=") <= -1) queryString += "&command=" + command;
		} else queryString = "?command="+command;
		document.location.href = window.location.pathname+queryString;
	};
	
	/** 페이지변경(POST) */
	window.postPage = function(pageIndex) {
		setValue(getForm().pageIndex, pageIndex);
		POST(getForm().action);
	};
	
	/** 페이지변경(2중리스트) */
	window.subPage = function(subIndex) {
		setValue(getForm().subIndex, subIndex);
		POST(getForm().action);
	};
	
	/** 페이지변경(GET) */
	window.getPage = function(pageIndex) {
		var params = window.location.href.split("?")[1];
		var param = (params)?params.split("&"):"";
		var queryString = "";
		if (param.length > 0) {
			for (var i=0;i<param.length;i++) {
				if (param[i].split("=")[1] != "") {
					if (param[i].indexOf("pageIndex=") != 0) queryString += (!queryString)?"?"+param[i]:"&"+param[i];
					else queryString += (!queryString)?"?pageIndex="+pageIndex:"&pageIndex="+pageIndex;
				}
			}
		} else queryString = "?pageIndex="+pageIndex;
		document.location.href = window.location.pathname+queryString;
	};
	
	/**공백제거*/
	window.trim = function(txt) {
		return txt.replace(/(^[ \f\n\r\t]*)|([ \f\n\r\t]*$)/g, "");
	};
	
	/**메세지박스*/
	window.Alert = function(title, msg, obj) {
		$('<div title="'+title+'"><p>'+msg+'</p></div>').dialog({
			autoOpen: true,
			width: 500,
			resizable: false,
			modal: true,
			closeOnEscape: false,
			buttons: [{text: "확인", click: function() {
					$(this).dialog("close");
					if (obj) {
						obj.focus();
					}
			}}]
		});
	};
	
	/**Date Class 설정*/
	$('.date').each(function() {
//		function enableDays(date) {
//		toYear = date.getFullYear();
//			toMonth = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0" + (date.getMonth() + 1);
//			toDate = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
//			toDay = (toYear + "-" + toMonth + "-"  + toDate).replace(/-/g, "");
//			
//			if (toDay >= "20140717" && toDay < "20140901") {
//				return [true, ""];
//			}
//			
//			return [false, ""];
//		}
//		
//		if ($(this).attr("name") == "resdate") { // 온라인예약하기
//			$(this).datepicker({
//				inline: true,
//				dateFormat: "yy-mm-dd",
//				beforeShowDay: enableDays
//			});	
//		} else {
//			$(this).datepicker({
//				inline: true,
//				dateFormat: "yy-mm-dd"
//			});
//		}
		
		$(this).datepicker({
			inline: true,
			dateFormat: "yy-mm-dd",
			changeMonth: $(this).attr('id') == "birth" ? true : false,
			changeYear: $(this).attr('id') == "birth" ? true : false,
			yearRange: 'c-99:c+99',
	        firstDay: 0,
	        isRTL: false,
	        duration: 200,
	        showAnim: 'slideDown',
	        showMonthAfterYear: true,
	        weekHeader: 'Wk',
	        yearRange: 'c-99:c+99'
	        //changeYear: true,
	        //changeMonth: true,
	        //showButtonPanel: true,
	        //showOtherMonths: true,
	        //selectOtherMonths: true,
			//inline: true
		});
        //changeYear: true,
        //changeMonth: true,
//		시작일은 종료일 이후 날짜를 선택 할 수 없으며,
//		종료일은 시작일 이전의 날짜를 선택 할 수 없습니다.
//		날짜를 변경하면 자동으로 시작일과 종료일의 선택가능 날짜가 변경됩니다. 
		$('#searchSdate').datepicker();
		$('#searchSdate').datepicker("option", "maxDate", $("#searchEdate").val());
		$('#searchSdate').datepicker("option", "onClose", function (selectedDate) {
			$("#searchEdate").datepicker("option", "minDate", selectedDate);
		});

		$('#searchEdate').datepicker();
		$('#searchEdate').datepicker("option", "minDate", $("#searchSdate").val());
		$('#searchEdate').datepicker("option", "onClose", function (selectedDate) {
			$("#searchSdate").datepicker("option", "maxDate", selectedDate);
		});
	});
	
	/** Tab 설정*/
	$('.ui-tab > li > a').not('.ui-btn-more').bind('click', function(){
		$(this).parents('ul.ui-tab').children('li').removeClass('selected');
		$(this).parent().addClass('selected');
		return false;
	});
	
});
//]]>