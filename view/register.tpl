<form action="/register" method="post">
    <table border="1" align="center" width="500">
        <tr>
            <td><label for="username">用户名</label></td>
            <td><input type="text" name="username" id="username"></td>
        </tr>
        <tr>
            <td><label for="password">密码</label></td>
            <td><input type="password" name="password" id="password" ></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
            <input type="submit" value="注册"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
              <a href="/login">已有账号？请登陆</a>
            </td>
        </tr>
    </table>
</form>