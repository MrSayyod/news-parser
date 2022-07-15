import React, {useState, useEffect} from 'react'
import axios from 'axios'

const Articles = () => {
  const [articles, setArticles] = useState([])

  useEffect(()=> {
    axios.get('/api/v1/articles.json')
    .then( resp =>{
      console.log(resp);
      setArticles(resp.data.data)
    })
    .catch( resp => console.log(resp))
  }, [articles.length ])

  const list = articles.map(item => {
    return (
      <li key={item.id}>
        <a href={item.attributes.url}>
          {item.attributes.title}
        </a>
      </li>
    )
  })
  return (
    <div>
      {list}
    </div>
  )
}

export default Articles