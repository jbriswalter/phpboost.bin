{section name=vars loop=$vars}
    {if $vars[vars].static}
        <div class="var">
            {if $show == 'summary'}
                static var {$vars[vars].var_name}, {$vars[vars].sdesc}<br />
            {else}
                <a name="{$vars[vars].var_dest|replace:"$":"_"}"></a>
                <span class="line-number">[line {if $vars[vars].slink}{$vars[vars].slink}{else}{$vars[vars].line_number}{/if}]</span><span class="tabulation">&nbsp;</span><span class="tabulation">&nbsp;</span>
                <strong>static</strong>
                <span class="var-type">{$vars[vars].var_type}</span><span class="tabulation">&nbsp;</span>
                <span class="var-name">{$vars[vars].var_name}</span><span class="tabulation">&nbsp;</span>
                {section name=tag loop=$vars[vars].tags}{if $tags[tag].keyword == 'var'}<span class="description">{$vars[vars].tags[tag].data}</span>{/if}{/section}
                {if $vars[vars].var_default} = <span class="value">{$vars[vars].var_default|replace:"\n":"<br />\n"|replace:" ":"&nbsp;"|replace:"\t":"&nbsp;&nbsp;&nbsp;"}</span>{/if}
                <hr />
                {include file="docblock.tpl" sdesc=$vars[vars].sdesc desc=$vars[vars].desc tags=$vars[vars].tags}
                <div class="tags">
                    <table border="0" cellspacing="0" cellpadding="0">
                        {if $vars[vars].var_overrides != ""}
                        <tr>
                            <td><strong>Overrides:</strong>&nbsp;&nbsp;</td>
                            <td>{$vars[vars].var_overrides}</td>
                        </tr>
                        {/if}
                    </table>
                </div>
            {/if}
        </div>
        {include file="classanchorsbar.tpl"}
    {/if}
{/section}
{section name=vars loop=$vars}
    {if !$vars[vars].static}
        <div class="var">
            {if $show == 'summary'}
                var {$vars[vars].var_name}, {$vars[vars].sdesc}<br />
            {else}
                <a name="{$vars[vars].var_dest|replace:"$":"_"}"></a>
                <span class="line-number">[line {if $vars[vars].slink}{$vars[vars].slink}{else}{$vars[vars].line_number}{/if}]</span><span class="tabulation">&nbsp;</span><span class="tabulation">&nbsp;</span>
                <span class="var-type">{$vars[vars].var_type}</span><span class="tabulation">&nbsp;</span>
                <span class="var-name">{$vars[vars].var_name}</span><span class="tabulation">&nbsp;</span>
                {section name=tag loop=$vars[vars].tags}{if $tags[tag].keyword == 'var'}<span class="description">{$vars[vars].tags[tag].data}</span>{/if}{/section}
                {if $vars[vars].var_default} = <span class="value">{$vars[vars].var_default|replace:"\n":"<br />\n"|replace:" ":"&nbsp;"|replace:"\t":"&nbsp;&nbsp;&nbsp;"}</span>{/if}
                <hr />
                {include file="docblock.tpl" sdesc=$vars[vars].sdesc desc=$vars[vars].desc tags=$vars[vars].tags}
                <div class="tags">
                    {if $vars[vars].var_overrides != ""}<strong>Overrides:</strong> {$vars[vars].var_overrides}{/if}
                </div>
            {/if}
        </div>
        {include file="classanchorsbar.tpl"}
    {/if}
{/section}
