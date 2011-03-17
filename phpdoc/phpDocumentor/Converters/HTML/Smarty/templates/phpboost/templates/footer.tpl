            </td>
        </tr>
            </table>
    <div style="text-align:center;">
        {assign var="packagehaselements" value=false}
        {foreach from=$packageindex item=thispackage}
            {if in_array($package, $thispackage)}
                {assign var="packagehaselements" value=true}
            {/if}
        {/foreach}
        {if $packagehaselements}
            <a href="{$subdir}classtrees_{$package}.html" class="menu">class tree: {$package}</a> -
            <a href="{$subdir}elementindex_{$package}.html" class="menu">index: {$package}</a> -
        {/if}
        <a href="{$subdir}elementindex.html" class="menu">all elements</a>
    </div>
    <div class="module_bottom_l"></div>         
    <div class="module_bottom_r"></div>
    <div class="module_bottom">Documentation generated on {$date} by <a href="{$phpdocwebsite}">phpDocumentor {$phpdocversion}</a></div>
</div>
<?php
require_once PATH_TO_ROOT . '/kernel/footer.php';
?>