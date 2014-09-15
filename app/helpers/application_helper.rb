module ApplicationHelper
  def foundation_alert_type(name)
  {
       'notice' => 'success',
      'success' => 'success',
        'alert' => 'alert',
      'warning' => 'warning',
        'error' => 'warning',
         'info' => 'standard',
    'secondary' => 'secondary'
  }[name]
end
end
