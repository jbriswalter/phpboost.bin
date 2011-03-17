{include file="header.tpl" eltype="class" hasel=true contents=$classcontents}

{if $conflicts.conflict_type}
    <div class="warning">Conflicts with classes:<br />
	   {section name=me loop=$conflicts.conflicts}{$conflicts.conflicts[me]}<br />{/section}
    </div>
{/if}
{* original <div class="warning">{$conflicts</div> *}

<h2>{if $is_interface}Interface{else}Class{/if} Overview</a></h2>
<pre>{section name=tree loop=$class_tree.classes}{$class_tree.classes[tree]}{$class_tree.distance[tree]}{/section}</pre>
<div class="description">{$sdesc|default:''}</div>
	{if $tutorial}
		<h4 class="classtutorial">{if $is_interface}Interface{else}Class{/if} Tutorial:</h4>
		<ul class="bb_ul"><li class="bb_li">{$tutorial}</li></ul>
	{/if}
{if count($tags) > 0}
	<div class="list">
	    <h4>Author(s):</h4>
	    <ul class="bb_ul">{section name=tag loop=$tags}{if $tags[tag].keyword eq "author"}<li class="bb_li">{$tags[tag].data}</li>{/if}{/section}</ul>
	</div>
{/if}
{assign var="version" value=""}
{assign var="copyright" value=""}

{section name=tag loop=$tags}
	{if $tags[tag].keyword eq "version"}{assign var="version" value=$tags[tag].data}{/if}
	{if $tags[tag].keyword eq "copyright"}{assign var="copyright" value=$tags[tag].data}{/if}
{/section}

{if $version}
	<h4>Version:</h4>
	<ul class="bb_ul"><li class="bb_li">{$version}</li></ul>
{/if}

{if $copyright}
	<h4>Copyright:</h4>
	<ul class="bb_ul"><li class="bb_li">{$copyright}</li></ul>
{/if}
<hr />
<table>
    <tr>
{if count($contents.method) > 0}
    <td>
    <div class="list">
        <h3><a href="#class_methods">Methods</a></h3>
        <ul class="bb_ul">{section name=contents loop=$contents.method}<li class="bb_li">{$contents.method[contents]}</li>{/section}</ul>
    </div>
    </td>
{/if}
{if $implements}
    <td>
    <div class="list">
        <p class="implements">
            Implements interfaces:
            <ul class="bb_ul">{foreach item="int" from=$implements}<li class="bb_li">{$int}</li>{/foreach}</ul>
        </p>
    </div>
    </td>
{/if}
{if count($contents.const) > 0}
<td>
    <div class="list">
        <h3><a href="#class_consts">Constants</a></h3>
        <ul class="bb_ul">{section name=contents loop=$contents.const}<li class="bb_li">{$contents.const[contents]}</li>{/section}</ul>
    </div>
    </td>
{/if}
<!--
{if count($contents.var) > 0}
    <div class="list">
        <h3><a href="#class_vars">Variables</a></h3>
        <ul class="inline">{section name=contents loop=$contents.var}<li class="bb_li">{$contents.var[contents]}</li>{/section}</ul>
    </div>
{/if}
 -->
</tr>
</table>

<hr />

<a name="class_details"></a>
<h2>Class Details</h2>
<div class="tags">{include file="docblock.tpl" type="class" sdesc=$sdesc desc=$desc}</div>
{include file="classanchorsbar.tpl"}
<br />

{if $methods & count($methods) > 0}
	<hr /><a name="class_methods"></a>
	<h3>Class Methods</h3>
	{include file="method.tpl"}
{/if}

{if $consts && count($consts) > 0}
	<hr /><a name="class_constss"></a>
	<h3>Class Constants</h3>
	<div class="list">{include file="const.tpl"}</div>
{/if}

{if $vars && count($vars) > 0}
    <hr /><a name="class_vars"></a>
    <h3>Class Variables</h3>
    <div class="list">{include file="var.tpl"}</div>
{/if}

{if ($iconsts && count($iconsts) > 0) || ($ivars && count($ivars) > 0) || ($imethods && count($imethods) > 0) }
    <hr />
    <table width="100%" border="0">
        <tr>
            {* original {if $children != "" 
                <td valign="top">
                <h3>Child classes:</h3>
                <div class="tags">
                {$children *}
                {if $children}
                <td valign="top">
                    <h3>Child classes:</h3>
                    <div class="tags">
                    {section name=kids loop=$children}
                    <dl>
                        <dt>{$children[kids].link}</dt>
                        <dd>{$children[kids].sdesc}</dd>
                    </dl>
                    {/section}
                    </div>
                </td>
            {/if}
            {if $iconsts && count($iconsts) > 0}
                <td valign="top">
                    <h3>Inherited Constants</h3>
                    {section name=iconsts loop=$iconsts}
                    <div class="tags">
                        <h4>Class: {$iconsts[iconsts].parent_class}</h4>
                        <dl>
                            {section name=iconsts2 loop=$iconsts[iconsts].iconsts}
                            <dt>{$iconsts[iconsts].iconsts[iconsts2].link}</dt>
                            <dd>{$iconsts[iconsts].iconsts[iconsts2].iconsts_sdesc}</dd>
                            {/section}
                        </dl>
                    </div>
                    {/section}
                </td>
            {/if}
            <!--
            {if $ivars && count($ivars) > 0}
            <td valign="top">
                <h3>Inherited Variables</h3>
                {section name=ivars loop=$ivars}
                    <div class="tags">
                        <h4>Class: {$ivars[ivars].parent_class}</h4>
                        <dl>
                            {section name=ivars2 loop=$ivars[ivars].ivars}
                            <dt>{$ivars[ivars].ivars[ivars2].link}{* original <a href="{$ivars[ivars].ivars[ivars2].ipath #{$ivars[ivars].ivars[ivars2].ivar_name ">{$ivars[ivars].ivars[ivars2].ivar_name </a> *}</dt>
                            <dd>{$ivars[ivars].ivars[ivars2].ivars_sdesc}</dd>
                            {/section}
                        </dl>
                    </div>
                {/section}
            </td>
            {/if}
             -->
            {if $imethods && count($imethods) > 0}
                <td valign="top">
                    <h3>Inherited Methods</h3>
                    {section name=imethods loop=$imethods}
                        <h4>Class: {$imethods[imethods].parent_class}</h4>
                        <dl style="margin-left:10px;">
                            {section name=im2 loop=$imethods[imethods].imethods}
                            <dt>{$imethods[imethods].imethods[im2].link}{* original    <a href="{$imethods[imethods].imethods[im2].ipath#{$imethods[imethods].imethods[im2].ifunction_name">{$imethods[imethods].imethods[im2].ifunction_call</a> *}</dt>
                            <dd>{$imethods[imethods].imethods[im2].sdesc}</dd>
                            {/section}
                        </dl>
                        <br />
                    {/section}
                </td>
            {/if}
        </tr>
    </table>
    <hr />
{/if}

{include file="footer.tpl"}