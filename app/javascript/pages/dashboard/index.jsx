import React, {useContext} from "react"
import { AuthContext } from '../../context/AuthContext';


const Dashboard = () => {
  const { authenticated } = useContext(AuthContext)

  console.log('Dashboard', authenticated)

  return (
    <>
      <h1 className="text-center">Dashboard</h1>
    </>
    
  )
}

export default Dashboard