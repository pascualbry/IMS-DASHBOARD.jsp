<%@ page import="Database.Variable_Product"%>
<%@ page import="Database.Variable_Order"%>
<%@ page import="CRUD.Get_Value"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <title>Dashboard</title>
  <link rel = "icon" href = "/IMS/PICTURE/icon.png" type = "image/x-icon"> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel = "stylesheet" type = "text/css" href = "/IMS/CSS/Dashboard.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
  <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
</head>

<body>
<div class="navbar">
  <div class="heading">
    <a href="/IMS/DASHBOARD/DashboardPO.jsp">ORDER<br/>TRACKING<br/>SYSTEM</a>
  </div>
  <ul>
    <li class="active">
      <a>
      <div class="icon">
        <i class="fa fa-tachometer" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Dashboard">Dashboard</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/PURCHASING/PurchasingPO.jsp">
      <div class="icon">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Purchasing">Purchasing</div>
      </a>
    </li>

    <li class="unactive">
      <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">
          <div class="icon">
            <i class="fa fa-cubes" aria-hidden="true"></i>
          </div>
          <div class="name" data-text="Inventory">Inventory <i class="fa fa-angle-down" aria-hidden="true" font-size="14"></i></div>
        </button>
        <div id="myDropdown" class="dropdown-content">
          <a href="/IMS/INVENTORY/BrandPO.jsp">Brand</a>
          <a href="/IMS/INVENTORY/CategoryPO.jsp">Category</a>
          <a href="/IMS/INVENTORY/ProductPO.jsp">Product</a>
        </div>
      </div>
    </li>

    <li class="unactive">
      <a href="/IMS/QUALITYCONTROL/QCGPO.jsp">
      <div class="icon">
        <i class="fa fa-check-square-o" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Quality Control">Quality Control</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/DELIVERY/DeliveryPO.jsp">
      <div class="icon">
        <i class="fa fa-truck" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Delivery">Delivery</div>
      </a>
    </li>

    <li class="unactive">
      <a href="/IMS/REPORTS/ReportsPO.jsp">
      <div class="icon">
        <i class="fa fa-line-chart" aria-hidden="true"></i>
      </div>
      <div class="name" data-text="Reports">Reports</div>
      </a>
    </li>

    <li class="unactive">
      <div class="dropdown">
        <button onclick="myFunction()" class="dropbtn">
          <div class="icon">
            <i class="fa fa-cog" aria-hidden="true"></i>
          </div>
          <div class="name" data-text="Settings">Settings <i class="fa fa-angle-down" aria-hidden="true" font-size="14"></i></div>
        </button>
        <div id="myDropdown" class="dropdown-content">
          <a href="/IMS/ACCOUNT/AccountsPO.jsp"><i class="fa fa-user" aria-hidden="true" font-size="14"></i>&nbsp;&nbsp;&nbsp;&nbsp;Account</a>
          <a href="/IMS/Login.jsp"><i class="fa fa-sign-out" aria-hidden="true" font-size="14"></i>&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
        </div>
      </div>
    </li>
  </ul>
</div>


<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>

<script type="text/javascript">
  FusionCharts.ready(function() {
    var salesRevChart = new FusionCharts({
      type: "bar2d",
      renderAt: "sales-chart-container",
      width: "550",
      height: "350",
      dataFormat: "json",
      dataSource: {
        chart: {
          caption: "Product Inventory",
          xaxisname: "PRODUCTS",
          yaxisname: "QUANTITY",
          numberprefix: "",
          showvalues: "0",
          bgColor: "#567086",
			    bgAlpha: "90",
			    canvasbgColor: "#4e657a",
			    canvasbgAlpha: "5",
			    baseFontSize: "14",
          baseFontColor: "#ffffff",
			    usePlotGradientColor: "0",
			    canvasBorderColor: "#ffffff",
          canvasBorderThickness: "1",
          canvasBorderAlpha: "80",
			    toolTipBgColor: "#808080",
			    plotBorderColor: "#ffffff",
			    yAxisMaxValue: "160",
				  yAxisMinValue: "0",
				  subcaptionFontSize: "10",
          theme: "carbon"
          },
          data: [
        	  
<%

Get_Value obj_Get_Value = new Get_Value();

List<Variable_Product> list = obj_Get_Value.Product();

Iterator<Variable_Product> it_list = list.iterator();

while (it_list.hasNext()) {
	
	Variable_Product obj_Variable_Product = new Variable_Product();
	
	obj_Variable_Product = it_list.next();
	
		if (obj_Variable_Product.getQuantity() <= 20){
			


%>
              {
                  label: "Product " + <%=obj_Variable_Product.getTag() %>,
                  value: <%=obj_Variable_Product.getQuantity() %>,
      				    color: "#f7604d"
                },
                
                
<%
		}else if(obj_Variable_Product.getQuantity() >= 150){
			
%>

			{
			    label: "Product " + <%=obj_Variable_Product.getTag() %>,
			    value: <%=obj_Variable_Product.getQuantity() %>,
					    color: "#4ed6b8"
			  },

<%			
		}else if(obj_Variable_Product.getQuantity() >= 100){
			
%>

			{
			    label: "Product " + <%=obj_Variable_Product.getTag() %>,
			    value: <%=obj_Variable_Product.getQuantity() %>,
					    color: "#a8d582"
			  },

<%			
		}else if(obj_Variable_Product.getQuantity() >= 50){
			
%>

			{
			    label: "Product " + <%=obj_Variable_Product.getTag() %>,
			    value: <%=obj_Variable_Product.getQuantity() %>,
					    color: "#9d66cc"
			  },

<%			
		}else if(obj_Variable_Product.getQuantity() >= 21){
			
%>

			{
			    label: "Product " + <%=obj_Variable_Product.getTag() %>,
			    value: <%=obj_Variable_Product.getQuantity() %>,
					    color: "#3889fc"
			  },

<%			
		}
		
}

%>
                
          ]
        }
    }).render();

    var dailyTransChart = new FusionCharts({
      type: "column2d",
      renderAt: "trans-chart-container",
      width: "550",
      height: "350",
      dataFormat: "json",
      dataSource: {
        chart: {
          caption: "Products with the Highest Demand",
          xaxisname: "PRODUCTS",
          yaxisname: "QUANTITY",
          showvalues: "0",
			    bgColor: "#567086",
			    bgAlpha: "90",
			    canvasbgColor: "#4e657a",
			    canvasbgAlpha: "5",
			    baseFontSize: "14",
          baseFontColor: "#ffffff",
			    usePlotGradientColor: "0",
			    canvasBorderColor: "#ffffff",
          canvasBorderThickness: "1",
          canvasBorderAlpha: "80",
			    showAlternateHGridColor: "0",
			    toolTipBgColor: "#808080",
			    plotBorderColor: "#ffffff",
			    yAxisMaxValue: "30",
				  yAxisMinValue: "0",
				  subcaptionFontSize: "10",
          theme: "carbon"
          },
          data: [
        	  
<%

Get_Value obj_Get_Value1 = new Get_Value();

List<Variable_Product> list1 = obj_Get_Value1.Product_Demand();

Iterator<Variable_Product> it_list1 = list1.iterator();

while (it_list1.hasNext()) {

	Variable_Product obj_Variable_Product = new Variable_Product();
	      	  	
	obj_Variable_Product = it_list1.next();
	
	String x = obj_Variable_Product.getTag();
      	  	
%>
          {
            label: "P" + <%=x%>,
            value: <%=obj_Variable_Product.getQuantity() %>,
				    color: "#f7604d"
          },

<%

}

%>
          
        ]
      }
    }).render();

    var dailyFootfallChart = new FusionCharts({
      type: "pie2d",
      renderAt: "footfall-chart-container",
      width: "550",
      height: "350",
      dataFormat: "json",
      dataSource: {
        chart: {
          caption: "Quality Control",
          xaxisname: "Date",
          yaxisname: "No. of Footfalls",
          showvalues: "0",
          bgColor: "#567086",
			    bgAlpha: "90",
			    canvasbgColor: "#4e657a",
			    baseFontSize: "14",
          baseFontColor: "#ffffff",
			    usePlotGradientColor: "0",
			    canvasBorderColor: "#ffffff",
          canvasBorderThickness: "1",
          canvasBorderAlpha: "80",
			    toolTipBgColor: "#808080",
			    plotBorderColor: "#ffffff",
			    smartLineColor: "#ff0000",
			    subcaptionFontSize: "10",
          theme: "carbon"
        },
        data: [ 
        	
<%
int pending = 0;
int ongoing = 0;
int qcpassed = 0;
int fordeliver = 0;
int delivered = 0;

Get_Value obj_Get_Value2 = new Get_Value();

List<Variable_Order> list2 = obj_Get_Value2.Order();

Iterator<Variable_Order> it_list2 = list2.iterator();

while (it_list2.hasNext()) {
        		
	Variable_Order obj_Variable_Order = new Variable_Order();
        		
	obj_Variable_Order = it_list2.next();
	
	pending += 1;
	
}

Get_Value obj_Get_Value3 = new Get_Value();

List<Variable_Order> list3 = obj_Get_Value3.OnGoing();

Iterator<Variable_Order> it_list3 = list3.iterator();

while (it_list3.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list3.next();
	
	ongoing += 1;
	
}

Get_Value obj_Get_Value4 = new Get_Value();

List<Variable_Order> list4 = obj_Get_Value4.QCPassed();

Iterator<Variable_Order> it_list4 = list4.iterator();

while (it_list4.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list4.next();

	qcpassed += 1;
	
}

Get_Value obj_Get_Value5 = new Get_Value();

List<Variable_Order> list5 = obj_Get_Value5.ForRelease();

Iterator<Variable_Order> it_list5 = list5.iterator();

while (it_list5.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list5.next();
	
	fordeliver += 1;
	
}

Get_Value obj_Get_Value6 = new Get_Value();

List<Variable_Order> list6 = obj_Get_Value6.Delivered();

Iterator<Variable_Order> it_list6 = list6.iterator();

while (it_list6.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list6.next();
	
	delivered += 1;
	
}
        		
%>		
        	
        {
          label: "Pending",
          value: <%=pending%>,
				  color: "#9d66cc"
        },
        {
            label: "On Going",
            value: <%=ongoing%>,
  				  color: "#f7604d"
        },
        {
            label: "QC Passed",
            value: <%=qcpassed%>,
  				  color: "#4ed6b8"
        },
        {
            label: "For Delivery",
            value: <%=fordeliver%>,
  				  color: "#3889fc"
        },
        {
            label: "Delivered",
            value: <%=delivered%>,
  				  color: "#db9c3f"
        },
          
        
        ]
      }
    }).render();

    var dailyCSatChart = new FusionCharts({
      type: "line",
      renderAt: "cs-chart-container",
      width: "550",
      height: "350",
      dataFormat: "json",
      dataSource: {
      chart: {
        caption: "Product Orders Delivered",
        xaxisname: "Month",
        yaxisname: "Quantity",
        yaxismaxvalue: "30",
        showvalues: "0",
        bgColor: "#567086",
			  bgAlpha: "90",
			  canvasbgColor: "#4e657a",
			  canvasbgAlpha: "5",
			  baseFontSize: "14",
        baseFontColor: "#ffffff",
			  usePlotGradientColor: "0",
			  canvasBorderColor: "#ffffff",
        canvasBorderThickness: "1",
        canvasBorderAlpha: "80",
			  showAlternateHGridColor: "0",
			  toolTipBgColor: "#808080",
			  plotBorderColor: "#ffffff",
			  lineThickness: "5",
			  subcaptionFontSize: "10",
			  labelDisplay: "rotate",
			  slantLabel: "2",
        theme: "carbon"
        },
        data: [
        {
          label: "January",
          value: "35",
				  color: "#f7604d"
        },
        {
          label: "February",
          value: "32",
				  color: "#4ed6b8"
        },
        {
          label: "March",
          value: "29",
				  color: "#a8d582"
        },
        {
          label: "April",
          value: "38",
				  color: "#d7d768"
        },
        {
          label: "May",
          value: "33",
				  color: "#9d66cc"
        },
        {
          label: "June",
          value: "36",
				  color: "#d7d768"
        },
        {
          label: "July",
          value: "30",
				  color: "#db9c3f"
        },
        {
          label: "August",
          value: "29",
				  color: "#9d66cc"
        },
        {
          label: "September",
          value: "35",
				  color: "#f7604d"
        },
        {
          label: "October",
          value: <%=delivered%>,
				  color: "#db9c3f"
        },
        


        ]
      }
    }).render();
  });
</script>


<div class="border-bottom" id="content">
  <div class="border-bottom">
    <div class="chartCont border-right" id="sales-chart-container">
    </div>
    <div class="chartCont" id="trans-chart-container">
    </div>
  </div>
  <div>
    <div class="chartCont border-right" id="footfall-chart-container">
    </div>
    <div class="chartCont" id="cs-chart-container">  
    </div>
  </div>
</div>

<div class="mainframe">
<h2>Quality Control</h2>
<div class="ex1">
 <table cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td>
       <table cellspacing="0" cellpadding="3" width="1050">
         <tr>
	        <th id="A" style="width: 12.67%">Order Number</th>
	        <th id="B" style="width: 12.67%">Acquisition Date</th>
	        <th id="C" style="width: 12.67%">Client Name</th>
	        <th id="D" style="width: 12.67%">Contact Number</th>
	        <th id="E" style="width: 12.67%">Location</th>
	        <th id="F" style="width: 12.67%">Status</th>
         </tr>
       </table>
    </td>
  </tr>
  <tr>
    <td>
       <div style="width:1050px; height:400px; overflow:auto;">
         <table cellspacing="0" cellpadding="3" width="1050" class="eto">
         
<%

Get_Value obj_Get_Value7 = new Get_Value();

List<Variable_Order> list7 = obj_Get_Value7.Order();

Iterator<Variable_Order> it_list7 = list7.iterator();

while (it_list7.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list7.next();
	
%>		

	<tr>
	
		<td style="width: 12.67%"><%=obj_Variable_Order.getTag() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getDateReceive() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getClientName() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getContactNumber() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getLocation() %></td>
		<td style="width: 12.67%"><a style="text-decoration: none; color: white">Pending</a></td>
      	
		
	</tr>
	
<%	
	
}

%>	 

<%

Get_Value obj_Get_Value8 = new Get_Value();

List<Variable_Order> list8 = obj_Get_Value8.OnGoing();

Iterator<Variable_Order> it_list8 = list8.iterator();

while (it_list8.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list8.next();
	
%>		

	<tr>
	
		<td style="width: 12.67%"><%=obj_Variable_Order.getTag() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getDateReceive() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getClientName() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getContactNumber() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getLocation() %></td>
        <td style="width: 12.67%"><a style="text-decoration: none; color: white">Ongoing</a></td>

      	
		
	</tr>
	
<%	
	
}

%>	 

<%

Get_Value obj_Get_Value9 = new Get_Value();

List<Variable_Order> list9 = obj_Get_Value9.QCPassed();

Iterator<Variable_Order> it_list9 = list9.iterator();

while (it_list9.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list9.next();
	
%>		

	<tr>
	
		<td style="width: 12.67%"><%=obj_Variable_Order.getTag() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getDateReceive() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getClientName() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getContactNumber() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getLocation() %></td>
		<td style="width: 12.67%"><a style="text-decoration: none; color: white">QC Passed</a></td>
      	
		
	</tr>
	
<%	
	
}

%>	 

<%

Get_Value obj_Get_Value10 = new Get_Value();

List<Variable_Order> list10 = obj_Get_Value10.ForRelease();

Iterator<Variable_Order> it_list10 = list10.iterator();

while (it_list10.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list10.next();
	
%>		

	<tr>
	
		<td style="width: 12.67%"><%=obj_Variable_Order.getTag() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getDateReceive() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getClientName() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getContactNumber() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getLocation() %></td>
        <td style="width: 12.67%"><a style="text-decoration: none; color: white">For Delivery</a></td>      
		
	</tr>
	
<%	
	
}

%>	   

<%

Get_Value obj_Get_Value11 = new Get_Value();

List<Variable_Order> list11 = obj_Get_Value11.Delivered();

Iterator<Variable_Order> it_list11 = list11.iterator();

while (it_list11.hasNext()) {
	
	Variable_Order obj_Variable_Order = new Variable_Order();
	
	obj_Variable_Order = it_list11.next();
	
%>		
	
	<tr>
	
		<td style="width: 12.67%"><%=obj_Variable_Order.getTag() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getDateReceive() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getClientName() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getContactNumber() %></td>
		<td style="width: 12.67%"><%=obj_Variable_Order.getLocation() %></td>
        <td style="width: 12.67%"><a style="text-decoration: none; color: white" href="/IMS/REPORTS/Reports.jsp">Delivered</a></td>   
		
	</tr>
	
<%	
	
}

%>	    


         </table>  
       </div>
    </td>
  </tr>
</table>
</div>
</div>
</body>
</html>
