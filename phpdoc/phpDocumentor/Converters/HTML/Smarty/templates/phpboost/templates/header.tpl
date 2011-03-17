<?php
$folders = array_reverse(explode('/', $_SERVER['REQUEST_URI']));
$path_to_root = '';
foreach ($folders as $folder)
{literal}{{/literal}
    if ($folder == 'doc')
    {literal}{{/literal}
        break;
    {literal}}{/literal}
    $path_to_root .= '../';
{literal}}{/literal}
define('PATH_TO_ROOT', trim($path_to_root, '/'));
require_once PATH_TO_ROOT . '/kernel/begin.php';
define('TITLE', '{$package} - {$title}');
$Bread_crumb->add('Documentation', PATH_TO_ROOT . '/doc/3.0/index.php');
$Bread_crumb->add('{$package}', '');
require_once PATH_TO_ROOT . '/kernel/header.php';
?>
<div class="module_position">                                   
        <div class="module_top_l"></div>                
        <div class="module_top_r"></div>
        <div class="module_top">{$package}</div>
        <div class="module_contents">
        <div>
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
        
        <table>
            <tr>
                <td style="vertical-align:top;">
                    {if count($ric) >= 1}
                            <div>{section name=ric loop=$ric}<p><a href="{$subdir}{$ric[ric].file}">{$ric[ric].name}</a></p>{/section}</div>
                    {/if}
                    {if $hastodos}
                            <p><a href="{$subdir}{$todolink}">Todo List</a></p>
                    {/if}
                    <fieldset>
                        <legend>Packages</legend>
                        <ul class="bb_ul">
                            {section name=packagelist loop=$packageindex}
                                    <li><a href="{$subdir}{$packageindex[packagelist].link}">{$packageindex[packagelist].title}</a></li>
                            {/section}
                        </ul>
                    </fieldset>
                    {if $tutorials}
                            <fieldset>
                                <legend>Tutorials/Manuals:</legend>
                                {if $tutorials.pkg}
                                        <h3>Package-level:</h3>
                                        {section name=ext loop=$tutorials.pkg}{$tutorials.pkg[ext]}{/section}
                                {/if}
                                {if $tutorials.cls}
                                        <h3>Class-level:</h3>
                                        {section name=ext loop=$tutorials.cls}{$tutorials.cls[ext]}{/section}
                                {/if}
                                {if $tutorials.proc}
                                        <h3>Procedural-level:</h3>
                                        {section name=ext loop=$tutorials.proc}{$tutorials.proc[ext]}{/section}
                                {/if}
                            </fieldset>
                    {/if}
                    {if !$noleftindex}{assign var="noleftindex" value=false}{/if}
                            {if !$noleftindex}
                            {if $compiledinterfaceindex}
                                    <fieldset>
                                        <legend>Interfaces</legend>
                                        {eval var=$compiledinterfaceindex}
                                    </fieldset>
                            {/if}
                            
                            {if $compiledclassindex}
                                <fieldset>
                                    <legend>Classes</legend>
                                    {eval var=$compiledclassindex}
                                </fieldset>
                            {/if}
                                    
                            {if $compiledfileindex}
                                <fieldset>
                                    <legend>Files</legend>
                                    {eval var=$compiledfileindex}
                                </fieldset>
                            {/if}
                    {/if}
                </td>
                <td style="vertical-align:top; padding-left:20px;">
                    {if !$hasel}{assign var="hasel" value=false}{/if}
                    {if $hasel}<h1>{$eltype|capitalize}: {$class_name}</h1><p>Source Location: {$source_location} [line {if $class_slink}{$class_slink}{else}{$line_number}{/if}]</p>{/if}