<%@page language="java" contentType="application/json; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%

Object[][] sampleArr = {
						{"���ʾ�","AOA","�ɱ׷�",25}
						,{"��ȿ��","��ũ��","����",26}
						,{"������","������ũ","�ڷ�Ʈ",22}
						,{"�����","�̽�����","��ȭ���",21}
						};

// JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();


for(int i=0;i < sampleArr.length; i++){
	JSONObject tempJson = new JSONObject();
	tempJson.put("name", sampleArr[i][0]);
	tempJson.put("group", sampleArr[i][1]);
	tempJson.put("job", sampleArr[i][2]);
	tempJson.put("age", sampleArr[i][3]);
	itemList.add(tempJson);
}
//jsonList.put("TOTAL",sampleArr.length);
//jsonList.put("ITEMS",itemList);

System.out.println(itemList);
// json data response.setContentType(application.json)
response.setContentType("application/json");
out.print(itemList);

%>