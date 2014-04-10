<#if list?exists>
<#list list as test>
       <li><a href="/art.html?id=${test.id}" target="_blank" title="">${test.articleTitle!""}</a></li>
</#list>
</#if>