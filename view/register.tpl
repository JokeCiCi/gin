<form action="#" id="register_form" method="post" enctype="application/json">
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
            <input type="button" value="注册" class="register"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
              <a href="/login">已有账号？请登陆</a>
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
  $(".register").click(function(){
      console.log(JSON.stringify($("#register_form").serializeObject()))
      $.ajax({
          type: "post",
          url: "/register",
          contentType: "application/json;charset=utf-8",
          data: JSON.stringify($("#register_form").serializeObject()),
          success:function(data){
              console.log(data);
          },
          err:function(err){
              console.log(err);
          }
      })
  })
</script>