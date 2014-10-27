<!doctype html>
<html>
<head>
<title>Title</title>
<meta charset="utf-8"/>
</head>
<body>
<h3>Перевірка статусу картки (GetCardStatus)</h3>
<form action="server.php" method="POST">
<input type="hidden" name="procedure" value="GetCardStatus">
<label>Номер картки:</label>
<input type="text" required name="CardCode" value="">
<br>
<input type="submit" value="Відправити">
</form>
<br>

<h3>Вивід даних про клієна (GetClientData)</h3>
<form action="server.php" method="POST">
<input type="hidden" name="procedure" value="GetClientData">
<label>Номер картки:</label>
<input type="text" required name="CardCode" value="">
<br>
<input type="submit" value="Відправити">
</form>
<br>

<h3>Замороження абонемента (SetStatusFrozenAbonement)</h3>
<form action="server.php" method="POST">
<input type="hidden" name="procedure" value="SetStatusFrozenAbonement">
<label>Номер картки:</label>
<input type="text" required name="CardCode" value="">
<br>
<label>Абонемент:</label>
<input type="text" required name="AbonementCode" value="">
<br>
<label>Дата від:</label>
<input type="text" required name="DateFrom" value="2014-10-14">
<br>
<label>Дата до:</label>
<input type="text" required name="DateTo" value="2014-10-24">
<br>
<input type="submit" value="Відправити">
</form>
<br>

<h3> Додавання грошей до акаонту (SetAddMoneyToAccount )</h3>
<form action="server.php" method="POST">
<input type="hidden" name="procedure" value="SetAddMoneyToAccount">
<label>Номер картки:</label>
<input type="text" required name="CardCode" value="">
<br>
<label>Сума:</label>
<input type="text" required name="Value" value="">
<br>
<input type="submit" value="Відправити">
</form>
<br>

<h3> Додавання бонусу за реєстрацію на сайті(SetBonusForSigninUoOnTheSite )</h3>
<form action="server.php" method="POST">
<input type="hidden" name="procedure" value="SetBonusForSigninUoOnTheSite">
<label>Номер картки:</label>
<input type="text" required name="CardCode" value="">
<br>
<label>Кількість бонусів:</label>
<input type="text" required name="Value" value="">
<br>
<input type="submit" value="Відправити">
</form>
<br>
</body>
</html>