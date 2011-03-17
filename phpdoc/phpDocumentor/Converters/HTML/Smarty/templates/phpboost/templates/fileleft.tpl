<ul class="bb_ul">
    {foreach key=subpackage item=files from=$fileleftindex}
        {if $subpackage != ""}
            <li>
                <strong>{$subpackage}</strong>
                <ul class="bb_ul">
        {/if}
        {section name=files loop=$files}
            <li>
                {if $files[files].link != ''}<a href="{$files[files].link}">{/if}
                {$files[files].title}
                {if $files[files].link != ''}</a>{/if}
            </li>
        {/section}
    </li>
    {if $subpackage != ""}
            </ul>
        </li>
    {/if}
    {/foreach}
</ul>