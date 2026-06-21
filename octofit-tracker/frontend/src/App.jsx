import React, {useEffect, useState} from 'react'

export default function App(){
  const [msg, setMsg] = useState('Loading...')

  useEffect(()=>{
    fetch('/api/health')
      .then(r => r.json())
      .then(d => setMsg(d.message))
      .catch(()=> setMsg('Backend not reachable'))
  }, [])

  return (
    <div style={{fontFamily:'system-ui,Segoe UI,Helvetica,Arial',padding:20}}>
      <h1>OctoFit Tracker</h1>
      <p>Frontend running on port 5173</p>
      <p>Backend says: {msg}</p>
    </div>
  )
}
