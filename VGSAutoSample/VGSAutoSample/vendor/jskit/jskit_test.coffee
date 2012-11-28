class JskitTest
	constructor: (@protonApp, @doc) ->

	appendTextNode: (text) ->
		e = @doc.createTextNode text
		hr = @doc.createElement 'hr'
		@doc.getElementById('resultText').appendChild(e)
		@doc.getElementById('resultText').appendChild(hr) 

	executeSuite: (suite) ->
		for func, params of suite
			@functionCall func, params, "this.appendTextNode('"+func+" test done')"

	functionCall: (name, params, callback) ->
		str = "this.protonApp.name(params, callback)"
		str = str.replace 'name', name
		if params is ""
			str = str.replace 'params,', ''
		else
			str = str.replace 'params,', params + ','
		str = str.replace 'callback', callback
		eval(str)

	invokeAllNonUITest: () ->
		nonUISuite = 
			'setConfig': "{'key':'jsKitTest', 'value':'lay.zhu'}",
			'getConfig': "{'key':'jsKitTest'}",
			'setValue': "{'key':'jsKitTest', 'value':'lay.zhu'}",
			'getValue': "{'key':'jsKitTest'}",
			'getConfigList': "null",
			'getAppList': "{'schemes': ['greeapp12345', 'greeapp54321']}",
			'getViewInfo': "null",
			'startLog': "{'loglevel':'100'}",
			'stopLog': "{'loglevel':'100'}",
			'deleteCookie': "{'key':'baidu'}",
			'setLocalNotificationEnabled': "{'enabled':'true'}",
			'recordAnayticsData': "{'tp':'pg','pr':{'key_1':'val_1'},'fr':'yyy'}",
			'getContactList': "",
			'getLocalNotificationEnabled': "",
			'flushAnalyticsQueue': "",
			'flushAnalyticsData': "",
			'collateForDeposit':"",
			'contactForDeposit':"{'id':'101'}",
			'noticeLaunchDeposit':"",
			'pushViewWithURL':"'http://www.baidu.com'",
			'openExternalView':"'http://www.baidu.com'",
			'showMessageDialog':"{'buttons':['OK','Cancel'],'title':'ok cancel dialog','message':'this is message','cancel_index':1}",
			'needUpdate':"",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(nonUISuite)
		@executeSuite nonUISuite

	invokePopupTest: () ->
		popupSuite = 
			'showDashboardFromNotificationBoard':"",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeRequestPopup: () ->
		popupSuite = 
			'showRequestDialog':"{'request':{'title':'request test','body':'request body'}}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeSharePopup: () ->
		popupSuite = 
			'showShareDialog':"{'type':'normal', 'message':'normal dialog'}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeInvitePopup: () ->
		popupSuite = 
			'showInviteDialog': "{'invite':{'body':'this is js invite'}}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeWebviewDialog: () ->
		popupSuite = 
			'showWebViewDialog':"{'URL':'http://www.baidu.com','size':[50, 50]}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeDepositProductDialog: () ->
		popupSuite = 
			'showDepositProductDialog': "",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeDepositHistoryDialog: ()->
		popupSuite = 
			'showDepositHistoryDialog': "",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeNeedUpgrade: ()->
		popupSuite = 
			'needUpgrade':"{'target_grade':'2'}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	invokeIAPHistoryDialog: () ->
		popupSuite = 
			'closeAndLaunchIAPHistoryDialog': "",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"

		console.log JSON.stringify(popupSuite)
		@executeSuite popupSuite

	inviteExternalUser: ()->
		viewSuite = 
			'inviteExternalUser':"{'URL':'http://www.baidu.com/'}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"
		console.log JSON.stringify(viewSuite)
		@executeSuite viewSuite

	showActionSheet: ()->
		viewSuite = 
			'showActionSheetL':"{ 'title' : 'Alert',
                               'buttons': ['OK', 'Do Nothing', 'Destroy All Buttons!', 'Cancel'],
                               'cancel_index' : 2,
                               'destructive_index' : 3}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"
		console.log JSON.stringify(viewSuite)
		@executeSuite viewSuite

	showAlertView: ()->
		viewSuite = 
			'showAlertView':"{ 'title' : 'Alert',
                             'message' : 'This is a message',
                             'buttons': ['OK', 'Do Nothing', 'Cancel'],
                             'cancel_index' : 0}",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"
		console.log JSON.stringify(viewSuite)
		@executeSuite viewSuite

	showDashboard: ()->
		viewSuite = 
			'showDashboard':"{
                           'URL':'http://www.google.com'
                           }",
			'setConfig': "{'key':'jskitTestDone', 'value':'true'}"
		console.log JSON.stringify(viewSuite)
		@executeSuite viewSuite


jskit = new JskitTest(proton.app, window.document)
window.jskit ? window.jskit = jskit