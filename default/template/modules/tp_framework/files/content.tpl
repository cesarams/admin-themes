<div class="tp-content">
	<div class="loader hidden">
        <div class="spinner">
            <div class="cube1"></div>
            <div class="cube2"></div>
        </div>
		<div class="message">
			{l s='Παρακαλούμε περιμένετε. Φορτώνει'}...
		</div>
	</div>
    <div class="framework-category-ajax-form ajax-form col-lg-12" style="display:block;">
        <form action="{$links->admin->categories->add}" method="post" data-pure-link="{$links->admin->categories->url}" data-refresh="1">
            {foreach $fields->category as $f}
                {if $f.name == 'categories'}
                    <div class="replace-select field col-lg-6">
                        <div class="container">
                            <label class="inactive" id="meta_title" for="display">
                                {l s='Επιλέξτε κατηγορία'}
                            </label>
                            <i class="fas fa-chevron-down"></i>
                            <i class="fas fa-chevron-up hidden"></i>
                            <div class="refresh-categories menu">
                                {foreach $tree as $c}
                                    {if $c.parent < 1}
                                        <div class="parent" data-id="{$c.id_tp_framework_category}" data-name="{$c.meta_title}">{$c.meta_title}</div>
                                    {/if}
                                    {if isset($c.descendants)}
                                        {foreach $c.descendants as $d}
                                            <div class="parent" data-id="{$d.id_tp_framework_category}" data-name="{$d.meta_title}">{'-- '|str_repeat:$d.level}{$d.meta_title}</div>
                                        {/foreach}
                                    {/if}
                                {/foreach}
                            </div>
                            <input type="hidden" name="parent" class="parent_hidden">
                        </div>
                    </div>
                {elseif $f.name == 'meta_title'}
                    <div class="field {$f.name} col-lg-6">
                        {foreach $languages as $l}
                            <input type="text" name="{$f.name}[]" class="value lang-field{if $current_language->iso_code != $l.iso_code} hidden{/if} {$l.iso_code}">
                        {/foreach}
                        <label class="move_right">{l s='Meta τίτλος'}</label>
                    </div>
                {elseif $f.name == 'link_rewrite'}
                    <div class="field {$f.name} col-lg-{if $column_remainder == 6}6{else}12{/if}">
                        <input type="text" name="{$f.name}" class="value">
                        <label class="move_right">{l s='Σύνδεσμος'}</label>
                    </div>
                {/if}
            {/foreach}
            <input type="hidden" value="{$links->admin->categories->token}" name="token">
            <div class="submit">
				<button type="submit" class="tp-ajax-submit" data-action="CategoryAdd">{l s='Προσθήκη κατηγορίας'}</button>
			</div>
            <div class="languages replace-select">
				<div class="container">
					<label class="current inactive">
						{$current_language->iso_code}
						{if count($languages) > 1}
							<i class="fas fa-chevron-down"></i>
							<i class="fas fa-chevron-up hidden"></i>
						{/if}
					</label>
					<div class="menu">
						{foreach $languages as $l}
							<div class="value tp-change-lang" data-value="{$l.iso_code}">{$l.iso_code}</div>
						{/foreach}
					</div>
				</div>
			</div>
        </form>
	</div>
</div>