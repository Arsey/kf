<? if (!$edit_mode): ?>
  <? include_partial('stepixBambookkoAdmin/style_switcher', array('counter' => $counter, 'edit_mode' => $edit_mode, 'options' => $options)) ?>
<? endif ?>
<table id="bambookko_block_<?= $counter ?>"
  class="bambookko_block <?= isset($options['theme']) ? $options['theme'] : '' ?>"
  bambookko_id="<?= $block->getId() ?>"
  bambookko_options='<?= $sf_data->getRaw('options_json')?>'>
<? if ($edit_mode): ?>
  <? include_partial('stepixBambookkoAdmin/style_switcher', array('counter' => $counter, 'edit_mode' => $edit_mode, 'options' => $options)) ?>
  <tr class="bambookko_block_buttons_row">
    <td colspan="3">
      <? include_partial('block_controls', array('counter' => $counter, 'active' => $active, 'edit_mode' => $edit_mode)) ?>
   	</td>
  </tr>
<? endif ?>
  <tr class="round_angle_row">
    <td class="round_angle"><em class="bt"><b></b></em></td>
    <td class="spacer"></td>
    <td class="round_angle"><em class="bt"><b></b></em></td>
  </tr>
  <tr class="bambookko_block_content_row">
    <td class="col_center drop_holder" rowspan="5" style="width: 788px;" bambookko_place="1" id="b7s00_<?= $counter ?>">
      <?= (isset($content_1)) ? $sf_data->getRaw('content_1') : '&nbsp;' ?>
    </td>
    <td></td>
    </td>
    <td class="col_right drop_holder" bambookko_place="2" style="height: 50px;" id="b7s01_<?= $counter ?>">
      <?= (isset($content_2)) ? $sf_data->getRaw('content_2') : '&nbsp;' ?>
    </td>
  </tr>
  <tr class="round_angle_row">
    <td></td>
    <td class="round_angle_bottom"><div class="block_shadow"><em class="bb"><b></b></em></div></td>
  </tr>
  <tr>
    <td style="height: 8px;"></td>
    <td></td>
  </tr>
  <tr class="round_angle_row">
    <td></td>
    <td class="round_angle"><em class="bt"><b></b></em></td>
  </tr>
  <tr class="bambookko_block_content_row">
    <td></td>
    <td class="col_right drop_holder" bambookko_place="3" id="b7s02_<?= $counter ?>">
      <?= (isset($content_3)) ? $sf_data->getRaw('content_3') : '&nbsp;' ?>
    </td>
  </tr>
  <tr class="round_angle_row">
    <td class="round_angle_bottom"><div class="block_shadow"><em class="bb"><b></b></em></div></td>
    <td></td>
    <td class="round_angle_bottom"><div class="block_shadow"><em class="bb"><b></b></em></div></td>
  </tr>
</table>

<? if (!$edit_mode && (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== FALSE)):?>
  <script type="text/javascript">
    // function is in the file - /js/modal.js
    alignTornBlocks('b7s00_<?= $counter ?>', 'b7s01_<?= $counter ?>', 'b7s02_<?= $counter ?>');
  </script>
<? endif ?>
