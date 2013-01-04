<div id="chronossimo_logo">
	<img src="../modules/chronossimo/logo_chronossimo.png" alt="Logo Chronossimo" title="Logo Chronossimo">
</div>

<h3>{l s='Liste des commandes à expédier'}</h3>
<form name="form_orderValidate" id="form_orderValidate" method="POST" action="index.php?tab=AdminChronossimo&token={$tokenAdminChronossimo}&action=3">
<table class="table" cellspacing="0" cellpadding="0">
	<thead>
		<tr class="nodrag nodrop">
			<th>{l s='ID'}</th>
			<th>{l s='Client'}</th>
			<!--<th>{l s='Statut'}</th>-->
			<th>{l s='Total'}</th>
			<th>{l s='Date'}</th>
			<th>{l s='Poids'}</th>
			<th>{l s='Pays'}</th>
			<th>{l s='Transporteur'}</th>
			
			<th>{l s='Signature'}</th>
			<th>{l s='Assurance'}</th>
			<th>{l s='Volumineux'}</th>
			<th>{l s='Actions'}</th>
			<th>{l s='Tarif'}</th>
		</tr>
	</thead>
	<tbody>
		{foreach from=$orders item=order}
		<tr>
			<td><input type="hidden" name="order_id[]" value="{$order.order_id}" /><input type="hidden" name="order_id_check[]" value="{$order.order_id}" /><input type="hidden" name="pays_origine[]" value="{$order.pays_origine}" /><input type="hidden" name="numero_sh[]" value="{$order.numero_sh}" />{$order.order_id}</td>
			<td>{$order.adresse.firstname} {$order.adresse.lastname}</td>
			<!--<td>{$order.statut}</td>-->
			<td>{$order.total} €</td>
			<td>{$order.order_fields.date_add}</td>
			<td><input type="hidden" name="poids[]" value="{$order.poids}" />{$order.poids} {$order.unite_poids}</td>
			<td>{$order.pays}</td>
			<td>{$order.transporteur}</td>
			
			<td>{if $order.signature}<input type="hidden" name="signature[]" value="{$order.order_id}" title="{l s='Demander la signature du colis'}" />{/if}<input type="checkbox" name="signature[]" disabled="disabled" value="{$order.order_id}"{if $order.signature} checked="checked"{/if} /></td>
			<td>{if $order.assurance}<input type="hidden" name="assurance[]" value="{$order.order_id}" title="{l s='Assurer la valeur du colis'}" />{/if}<input type="checkbox" name="assurance[]" disabled="disabled" value="{$order.order_id}"{if $order.assurance} checked="checked"{/if} /></td>
			<td>{if $order.volumineux}<input type="hidden" name="volumineux[]" value="{$order.order_id}" title="{l s='Déclarer le colis volumineux'}" />{/if}<input type="checkbox" name="volumineux[]" disabled="disabled" value="{$order.order_id}"{if $order.volumineux} checked="checked"{/if} /></td>
			<td><a href="pdf.php?id_order={$order.order_id}&pdf" target="_blank" ><img src="../img/admin/tab-invoice.gif" title="{l s='Voir la facture'}" /></a> <a href="index.php?tab=AdminOrders&id_order={$order.order_id}&vieworder&token={$tokenAdminOrders}" target="_blank" ><img src="../img/admin/details.gif" title="{l s='Voir le détail de la commande'}" /></a></td>
			<td><input type="hidden" name="tarif[]" value="{$order.tarif}" />{$order.tarif}</td>
		</tr>
		{/foreach}

	</tbody>
</table>

<input type="hidden" name="nature_douane" value="{$nature_douane}" />
<input type="hidden" name="orders_to_send" value="{$orders_to_send}" />
<input type="hidden" name="joindre_facture" value="{$joindre_facture}" />
<input type="hidden" name="set_statut" value="{$set_statut}" />
<input type="hidden" name="set_suivi" value="{$set_suivi}" />
<input type="hidden" name="livraison_auto" value="{$livraison_auto}" />
<input type="hidden" name="sessionID" id="sessionID" value="{$sessionID}" />
<br /><br /><br /><h3>Total des expéditions: {$total} €</h3>
<br /><br />
<label class="redirect_secure_paiement"><input type="checkbox" id="redirect_secure_paiement" name="paiement_automatique" value="1" checked="checked" />{l s='Entrez mes informations bancaires'}</label>
<br /><br />
			<div id="cb_infos">
				<fieldset>
				<img src="../modules/chronossimo/secure.png" class="paiement_secure_img" />
				<legend>{l s='Informations de paiement'}</legend>
				
				<div class="margin-form">{l s='Remplissez les informations de votre moyen de paiement'}</div>
				<div class="margin-form">{l s='Si vous ne souhaitez pas sauvegarder vos informations de paiement, elles seront demandés à chaque paiement'}</div>
					<label>{l s='Nom'} : </label>
						<div class="margin-form">
							<input type="text" id="cb_name" name="cb_name" value="{$cb_name}" />
						</div>
					<label>{l s='Numéro de carte bleu'} : </label>
						<div class="margin-form">
							<input type="text" id="cb_num" name="cb_num" value="{$cb_num}" />
						</div>
					<label>{l s='Code de vérification'} : </label>
						<div class="margin-form">
							<input type="text" id="cb_verif" name="cb_verif" value="{$cb_verif}" />
						</div>
					<label>{l s='Date de validité'} : </label>
						<div class="margin-form">
							<input class= "cb_validite" type="text" id="cb_month" name="cb_month" value="{if $cb_month}{$cb_month}{else}MM{/if}" /> / <input class= "cb_validite" type="text" id="cb_year" name="cb_year" value="{if $cb_year}{$cb_year}{else}AAAA{/if}" />
						</div>
					<label>{l s='Sauvegarder mes informations'} : </label>
						<div class="margin-form">
							<input type="checkbox" name="sauvegarde_cb" checked="checked" value="1" />
						</div>
						<a target="_blank" href="http://www.visa.fr/les-innovations-visa/mes-solutions-de-paiement/verified-by-visa.aspx"><img src="../modules/chronossimo/3dsecure.png" class="paiement_3dsecure_img" /></a>
				</fieldset>
				</div>
				
				
				<div class="infos_complements hide">
				<fieldset>
					<legend>{l s='Fonctionnalités désactivées'}</legend>
					
					<p>Vous serez redirigé vers Ogone pour le règlement de vos affranchissements.</p><br />
					<p>Ce mode de règlement ne prend pas en charge les fonctionnalités suivantes :</p>
					<ul>
						<li>Mise à jour automatique du statut des commandes lors de l'expédition des colis</li>
						<li>Intégration automatique du numéro de suivi</li>
						<li>Mise à jour automatique du statut des commandes lors de la livraison des colis</li>
						<li>Optimisation de l'impression sur étiquettes autocollantes</li>
					</ul>
				</fieldset>
				</div>
<br />
<p style="margin-top: 20px;"><input type="submit" id="bSubmit" value="{l s='Envoyer les colis'}" name="submit" class="button"/></p>
</form>
{literal}
<script type="text/javascript">
$(document).ready(function() {
	last_progress = 0;
	last_update = (new Date()).getTime();
	progress_view = 0;
	progress_step = 0;
	
	$("#form_orderValidate").submit(function() {
		returnVal = true;
		if ($("#redirect_secure_paiement").attr('checked') && ($("#cb_name").val().length<2 || $("#cb_num").val().length<8 || $("#cb_verif").val().length<3 || $("#cb_month").val().length<2 || $("#cb_year").val().length<2 ))
		{
			alert("Vous devez completer vos informations bancaires");
			returnVal = false;
		}
		
		 if (returnVal)
		 {
        		progressBar();
		 }
			return returnVal;
		});
		
		
		$("#redirect_secure_paiement").change(function() {
			detect_info_cb();
		});
		//detect_info_cb();
		
		function detect_info_cb() {
			if ($("#redirect_secure_paiement").attr('checked'))
			{
				$(".infos_complements").slideUp(function() { $("#cb_infos").slideDown() });
			}
			else
			{
				$("#cb_infos").slideUp(function() { $(".infos_complements").slideDown(); });
			}
		}
		

});
</script>
{/literal}

<div id="progressDiv" style="display: none;">
	<img src="../modules/chronossimo/ajax_loader.gif" width="64" height="64"/>
	<div id="progressbar"></div>
	<div id="progressText"></div>
</div>
<script src="../modules/chronossimo/js/jquery.timers.js" type="text/javascript"></script>
<script src="../modules/chronossimo/js/jquery.progressbar.js" type="text/javascript"></script>
<script src="../modules/chronossimo/js/chronossimo.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="../modules/chronossimo/js/jquery.progressbar.css" />
<link type="text/css" rel="stylesheet" href="../modules/chronossimo/chronossimo.css" />