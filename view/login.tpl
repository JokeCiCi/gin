<form action="#" id="login_form" method="post" enctype="application/json">
    <table border="1" align="center" width="500">
        <tr>
            <td><label for="phone">用户名</label></td>
            <td><input type="text" name="phone" id="phone"></td>
        </tr>
        <tr>
            <td><label for="password">密码</label></td>
            <td><input type="password" name="password" id="password" ></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
            <input type="button" value="登陆" class="login"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
              <a href="/register">没有账号？请注册</a>
            </td>
        </tr>
    </table>
</form>

<script language="JavaScript" src="static/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
  $.fn.serializeObject = function(){
      var o={};
      var a = this.serializeArray();
      $.each(a,function(){
          if(o[this.name]){
              if(!o[this.name].push){
                  o[this.name]=[o[this.name]];
              }
              o[this.name].push(this.value || '');
          }else{
              o[this.name]=this.value || '';
          }
      });
      return o;
  };
  $(".login").click(function(){
      $.ajax({
          type: "post",
          url: "/login",
          contentType: "application/json;charset=utf-8",
          data: JSON.stringify($("#login_form").serializeObject()),
          success:function(data){
              console.log(data);
          },
          err:function(err){
              console.log(err);
          }
      })
  })
</script>