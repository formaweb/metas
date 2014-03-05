class DummyController
  def default_meta_tags
    {
      description: 'Test',
      keywords: 'test, other, another',
      title: 'test title',
      og: {
        locale: 'pt_BR',
        type: 'website',
        site_name: 'Example'
      },
      twitter: {
        card: 'summary',
        site: '@example',
        title: 'Example title',
        domain: 'example.com'
      }
    }
  end
end