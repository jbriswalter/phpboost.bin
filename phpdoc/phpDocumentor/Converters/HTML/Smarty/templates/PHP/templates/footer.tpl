                </td>
            </tr>
		</table>
        <div class="horizontal-menu">
		    {assign var="packagehaselements" value=false}
		    {foreach from=$packageindex item=thispackage}
		        {if in_array($package, $thispackage)}
		            {assign var="packagehaselements" value=true}
		        {/if}
		    {/foreach}
		    {if $packagehaselements}
		       [ <a href="{$subdir}classtrees_{$package}.html" class="menu">class tree: {$package}</a> ]
		       [ <a href="{$subdir}elementindex_{$package}.html" class="menu">index: {$package}</a> ]
		    {/if}
		    [ <a href="{$subdir}elementindex.html" class="menu">all elements</a> ]
		</div>
		<div id="footer"><span>Documentation generated on {$date} by <a href="{$phpdocwebsite}">phpDocumentor {$phpdocversion}</a></span></div>
	</body>
</html>