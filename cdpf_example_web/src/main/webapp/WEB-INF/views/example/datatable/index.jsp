<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
<title>首页</title>
<style>
table.dataTable.no-footer{
    border-bottom: 0;
}
</style>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>示例代码</li>
			<li>>DataTable</li>
		</ul>
	</div>
	
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-cogs"></i>操作面板
			</div>
			<div class="tools">
				<a href="javascript:;" class="collapse"> </a>
			</div>
		</div>
		<div class="portlet-body">
			<div class="table-responsive">
				<table class="searchTable">
					<tr>
						<td>	
											
							<button type="button" class="btn btn-success" id="sample_editable_1_new">
								<i class=" fa fa-plus bigger-110"></i> 新增
							</button>	
					   			
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" id="tb">
			<table class="table table-striped table-bordered table-hover"
				id="sample_editable_1">
				<thead>
					<tr>
						<th >账号</th>
						<th >姓名</th>
						<th >角色</th>
						<th >部门</th>
						<th >修改</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody id="bd">
				
				</tbody>
			</table>
		</div>
	</div>





	<critc-script> <script type="text/javascript">
	$(function() {
		init();
		
	});
	
	      
  function init(){
		 	 
          //提示信息
           var lang = {   		 
    		   "search": "搜索:",
    		   "lengthMenu":  "每页 _MENU_ 项",
    		   "info": "当前显示 _START_  - _END_ 条，共_TOTAL_ 条记录", 
    		   "infoFiltered": "(由 _MAX_ 项结果过滤)",
    		   "emptyTable": "表中数据为空",
    		   "zeroRecords": "没有匹配结果",
    		   "infoEmpty": "当前显示第 0 至 0 项，共 0 项",
           };
           var table = $('#sample_editable_1');	
           //初始化表格
           var oTable = table.dataTable({
        	               "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "全部"]],        
        	              "pageLength": 5,//设置初始显示记录数  
        	              
        	               "language": lang,  //提示信息  
        	              "columnDefs": [{ 
        	                  'orderable': true,
        	                  'targets': [0]
        	              }, {
        	                  "searchable": true,
        	                  "targets": [0]
        	              },
        	               {
        	                  "targets": 4,
        	                  "searchable": false,
        	                  "render": function ( data, type, row, meta ) {        	                	         	                	  
        	                      return "<a class='edit' href=''>修改</a>";
        	                    }
        	                },
        	                {
          	                  "targets": 5,
          	                  "searchable": false,
          	                  "render": function ( data, type, row, meta ) {
          	                      return "<a class='delete' href=''>删除</a>";
          	                    }
          	                } 
          	                
          	                ],
        	              "order": [
        	                  [0, "asc"]
        	              ],
        	                 	                     	             
        	               "ajax":"${dynamicServer}/example/datatable/getData.htm",        	            		
        	               "columns": [        	                           
        	                            {"data": "id"},
        	                            {"data": "name"},
        	                            {"data": "roleName"},
        	                            {"data": "partement"}, 
        	                           
        	                ] 
       	            	 
        	            	 

           });
         
      
       
	  

      var nEditing = null;
      var nNew = false;

      $('#sample_editable_1_new').click(function (e) {
          e.preventDefault();
          if (nNew && nEditing) {
              if (confirm("之前的记录还未保存，你要保存吗?")) {
                  saveRow(oTable, nEditing); // save
                  $(nEditing).find("td:first").html("Untitled");
                  nEditing = null;
                  nNew = false;

              } else {
                  oTable.fnDeleteRow(nEditing); // cancel
                  nEditing = null;
                  nNew = false;
                  
                  return;
              }
          }
          editRow();
      
      }); 
      
      function editRow() {
    	  var row ="<tr>"+
    	  "<td><input type='text' class='form-control input-small' value=></td>"+
    	  "<td><input type='text' class='form-control input-small' value=></td>"+
    	  "<td><input type='text' class='form-control input-small' value=></td>"+
    	  "<td><input type='text' class='form-control input-small' value=></td>"+
    	  "<td><a class='bc' href=''>保存</a></td>"+
    	  "<td><a class='cancel' href=''>取消</a></td>"+
    	  "</tr>"
    	  $('#sample_editable_1').prepend(row);
    
      }
      

      table.on('click', '.delete', function (e) {
    	  e.preventDefault(); 
           var nRow = $(this).parents('tr')[0];                        
           var jqTds = $('>td', nRow);
           var id = jqTds[0].innerHTML;      
          bootbox.confirm("你确定要删除该节点吗？", function (result) {
              if (result) {
            	  $.ajax({
		            	url:"${dynamicServer}/example/datatable/deleteData.htm",
		            	data:{
		            		id:id
		            	},
		            	success:function(result){
		            		//nRow.remove();
		            		oTable.fnDeleteRow(nRow);
		            	}
		            });  
            	  
                	
              }
          })
      
        
      }); 

      table.on('click', '.cancel', function (e) {
          e.preventDefault();
          var nRow = $(this).parents('tr')[0];
          var jqTds = $('>td', nRow);
          var jqInputs = $('input', nRow);
          
          var flag = jqInputs[0].value==""&&jqInputs[1].value==""&&jqInputs[2].value==""&&jqInputs[3].value=="";
       
          if (flag) {
        	 //nRow.remove();	
              oTable.fnDeleteRow(nRow);
              nEditing = null;
              nNew = false;
          } else {
        	
        	    
              jqTds[0].innerHTML = jqInputs[0].value;
              jqTds[1].innerHTML = jqInputs[1].value ;
              jqTds[2].innerHTML =  jqInputs[2].value;
              jqTds[3].innerHTML = jqInputs[3].value ;
              jqTds[4].innerHTML = "<a class='edit' href=''>修改</a>";
              jqTds[5].innerHTML = '<a class="delete" href="">删除</a>';
            
              //restoreRow(oTable, nEditing);
              nEditing = null;
          }
      }); 

      table.on('click', '.edit', function (e) {
	          e.preventDefault();
	          nNew = false;
	        
	          /* 得到点击的当前行 */
	          var nRow = $(this).parents('tr')[0];
	        
	          
	          if (nEditing !== null && nEditing != nRow) {
	              /* 点击的修改不是本行则重新加载以前数据 */
	              restoreRow(oTable, nEditing);
	              editRow2(oTable, nRow);
	              nEditing = nRow;
	          }  else {
	        	  var objs = $(this).parents('tr').children('td');
			      var jqTds = $('>td', nRow);
			      var jqInputs = $('input', nRow);
			     var id = jqTds[0].innerHTML;
			      jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + jqTds[0].innerHTML+ '">';
			      jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + jqTds[1].innerHTML + '">';
			      jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + jqTds[2].innerHTML + '">';
			      jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + jqTds[3].innerHTML + '">';
			      jqTds[4].innerHTML = "<input type='hidden' class='id' value='"+id+"'/><a class='update' href=''>保存</a>";
			      jqTds[5].innerHTML = '<a class="cancel" href="">取消</a>';
	              nEditing = nRow;
	          } 
      });
      
      table.on('click', '.bc', function (e) {
          e.preventDefault();
          nNew = false;
          
          /* 得到点击的当前行 */
          var nRow = $(this).parents('tr')[0];
          addRow(oTable, nRow);
          
       
  });
      table.on('click', '.update', function (e) {
          e.preventDefault();
          nNew = false;
          
          /* 得到点击的当前行 */
          var nRow = $(this).parents('tr')[0];
          var oldId = $(this).parents('tr').find(".id").val();
      
          if (nEditing !== null && nEditing != nRow) {
              /* 点击的修改不是本行则重新加载以前数据 */
              restoreRow(oTable, nEditing);
              editRow(oTable, nRow);
              nEditing = nRow;
          } else if (nEditing == nRow && this.innerHTML == "保存") {
        	  
        	   var jqInputs = $('input', nRow);
        	   var objs = $(this).parents('tr').children('td');      
			      $.ajax({
			      	url:"${dynamicServer}/example/datatable/updateData.htm",
			      	data:{
			      		oldId:oldId,
			      		id:jqInputs[0].value,      	     
			      		name:jqInputs[1].value,
			      		roleName:jqInputs[2].value,
			      		partement:jqInputs[3].value
			      	},
			      	success:function(result){
			      		
			      	    var jqTds = $('>td', nRow);			      	      
					      jqTds[0].innerHTML = jqInputs[0].value;
					      jqTds[1].innerHTML = jqInputs[1].value ;
					      jqTds[2].innerHTML =  jqInputs[2].value;
					      jqTds[3].innerHTML = jqInputs[3].value ;
					      jqTds[4].innerHTML = "<a class='edit' href=''>修改</a>";
					      jqTds[5].innerHTML = '<a class="delete" href="">删除</a>';
			      	   			             
			      	}
			      });  
        	      nEditing = null;
        	   
           
          } 
  });
 

  }
	      
  function restoreRow(oTable, nRow2) {
	  var nRow = $(this).parents('tr')[0];
      var jqTds = $('>td', nRow);
      var jqInputs = $('input', nRow);
	      console.log(jqTds);
      jqTds[0].innerHTML = jqInputs[0].value;
      jqTds[1].innerHTML = jqInputs[1].value ;
      jqTds[2].innerHTML =  jqInputs[2].value;
      jqTds[3].innerHTML = jqInputs[3].value ;
      jqTds[4].innerHTML = "<a class='edit' href=''>修改</a>";
      jqTds[5].innerHTML = '<a class="delete" href="">删除</a>';
    

      
  }

  
  function editRow2(oTable, nRow) {
      var aData = oTable.fnGetData(nRow);
      
      var jqTds = $('>td', nRow);
      jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData.id + '">';
      jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData.name + '">';
      jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData.roleName + '">';
      jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData.partement + '">';
      jqTds[4].innerHTML = "<input type='hidden' class='id' value='"+aData.id+"'/><a class='update' href=''>保存</a>";
      jqTds[5].innerHTML = '<a class="cancel" href="">取消</a>';
  }

  
  
  function addRow(oTable, nRow) {
      var jqInputs = $('input', nRow);
         
      $.ajax({
      	url:"${dynamicServer}/example/datatable/addData.htm",
      	data:{
      		id:jqInputs[0].value,      	     
      		name:jqInputs[1].value,
      		roleName:jqInputs[2].value,
      		partement:jqInputs[3].value
      	},
      	success:function(result){
      	
      	 
      	       var jqTds = $('>td', nRow);
      	      
		      jqTds[0].innerHTML = jqInputs[0].value;
		      jqTds[1].innerHTML = jqInputs[1].value ;
		      jqTds[2].innerHTML =  jqInputs[2].value;
		      jqTds[3].innerHTML = jqInputs[3].value ;
		      jqTds[4].innerHTML = "<a class='edit' href=''>修改</a>";
		      jqTds[5].innerHTML = "<input type='hidden' class='id' value='"+jqInputs[0].value+"'/><a class='delete' href=''>删除</a>";
		     // oTable.ajax.url("${dynamicServer}/example/datatable/getData.htm").load();
              
              
           
               
             
      	}
      });  
   
  }
  function saveRow(oTable, nRow) {
      var jqInputs = $('input', nRow);
      oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
      oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
      oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
      oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
      oTable.fnUpdate('<a class="edit" href="">修改</a>', nRow, 4, false);
      oTable.fnUpdate('<a class="delete" href="">删除</a>', nRow, 5, false);
      oTable.fnDraw();
  }

  function cancelEditRow(oTable, nRow) {
      var jqInputs = $('input', nRow);
      oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
      oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
      oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
      oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
      oTable.fnUpdate("<a class='edit' href=''>修改</a>", nRow, 4, false);
      oTable.fnDraw();
  }
   

	

   </script> </critc-script>
</body>