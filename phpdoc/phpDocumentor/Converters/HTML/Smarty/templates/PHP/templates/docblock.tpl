{if $sdesc != ''}<div class="description">{$sdesc|default:''}</div>{/if}
{if $desc != ''}<div class="description">{$desc|default:''}</div>{/if}
{if count($tags) > 0}
    <h4>Tags:</h4>
    <div class="tags">
        <ul>{section name=tag loop=$tags}{if $tags[tag].keyword != 'var'}<li><strong>{$tags[tag].keyword}:</strong> {$tags[tag].data}</li>{/if}{/section}</ul>
    </div>
{/if}