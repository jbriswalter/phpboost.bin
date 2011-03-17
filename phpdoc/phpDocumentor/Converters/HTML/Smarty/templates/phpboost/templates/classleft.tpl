<ul class="bb_ul">
    {foreach key=subpackage item=files from=$classleftindex}
        {if $subpackage != ""}
            <li>
                <strong>{$subpackage}</strong>
                <ul class="bb_ul">
        {/if}
        {section name=files loop=$files}
            <li>
                {if $files[files].link != ''}<a href="{$files[files].link}">{/if}{$files[files].title}{if $files[files].link != ''}</a>{/if}
            </li>
        {/section}
        {if $subpackage != ""}
                </ul>
            </li>
        {/if}
    {/foreach}
</ul>